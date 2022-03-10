#include "cyu3error.h"
#include "cyfxslfifosync.h"
#include "cyu3os.h"
#include "cyu3gpif.h"
#include "cyu3pib.h"
#include "pib_regs.h"
#include "cyu3utils.h"
#include <cyu3system.h>
#include <slavefifoconfig.h>
#include <cyu3spi.h>
#include <cyu3pib.h>
#include <cyu3gpio.h>
#include <cyfx3_api.h>
#include <cyu3usb.h>

#define RESET 0
#define ALPHA_RESET 0XC

uint32_t glDMARxCount = 0;               // Number of buffers received from USB
uint32_t glDMATxCount = 0;               // Number of buffers sent to USB
CyBool_t glIsApplnActive = CyFalse;      // Check if application is active

CyU3PThread slFifoAppThread;             // Application's thread structure
CyU3PDmaChannel glChHandleSlFifoUtoP;    // DMA Channel handle for U2P transfer
CyU3PDmaChannel glChHandleSlFifoPtoU;    // DMA Channel handle for P2U transfer

// Initializing the debug mechanism and main slave FIFO application
void SlaveFifoAppThread_Entry(uint32_t input) {
    SlaveFifoAppDebugInit();
    SlaveFifoAppInit();

    for (;;) {
        ThreadSleep(1000);
        if (glIsApplnActive) {
            // Print the number of buffers received so far from the USB host. 
            DebugPrint(6, "Data tracker: buffers received: %d, buffers sent: %d.\n", glDMARxCount, glDMATxCount);
        }
    }
}

// Application define function for creating threads
void ApplicationDefine() {

    // Allocate memory for thread
    void *ptr = NULL;
    uint32_t retThrdCreate = CY_U3P_SUCCESS;

    // Allocate the memory for the thread
    ptr = CyU3PMemAlloc(CY_FX_SLFIFO_THREAD_STACK);

    // Create the thread for the application
    retThrdCreate = CyU3PThreadCreate(&slFifoAppThread,            // Slave FIFO app thread structure
                          "21:Slave_FIFO_sync",                    // Thread ID and thread name 
                          SlaveFifoAppThread_Entry,                // Slave FIFO app thread entry function 
                          0,                                       // No input parameter to thread 
                          ptr,                                     // Pointer to the allocated thread stack 
                          CY_FX_SLFIFO_THREAD_STACK,               // App Thread stack size 
                          CY_FX_SLFIFO_THREAD_PRIORITY,            // App Thread priority 
                          CY_FX_SLFIFO_THREAD_PRIORITY,            // App Thread pre-emption threshold 
                          CYU3P_NO_TIME_SLICE,                     // No time slice for the application thread 
                          CYU3P_AUTO_START                         // Start the thread immediately 
                          );
}

// Debug mechanism function
void SlaveFifoAppDebugInit() {
    CyU3PReturnStatus_t apiRetStatus = CyU3PSpiInit();
    CyU3PSpiConfig_t spiConfig;

    if (apiRetStatus != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Configuring the SPI
    CyU3PMemSet((uint8_t*) &spiConfig, 0, sizeof(spiConfig));
    spiConfig.isLsbFirst = CyFalse;
    spiConfig.cpol = CyTrue;
    spiConfig.ssnPol = CyFalse;
    spiConfig.cpha = CyTrue;
    spiConfig.leadTime = CY_U3P_SPI_SSN_LAG_LEAD_HALF_CLK;
    spiConfig.lagTime = CY_U3P_SPI_SSN_LAG_LEAD_HALF_CLK;
    spiConfig.ssnCtrl = CY_U3P_SPI_SSN_CTRL_FW;
    spiConfig.clock = 8000000;
    spiConfig.wordLen = 8;

    apiRetStatus = CyU3PSpiSetConfig(&spiConfig, NULL);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Set SPI transfer size (Configured to infinitely large size so that debug prints aren't limited)
    apiRetStatus = CyU3PSpiSetBlockXfer(0xFFFFFFFF, 0);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Initialize the debug module
    apiRetStatus = CyU3PDebugInit(CY_U3P_LPP_SOCKET_SPI_CONS, 8);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(apiRetStatus);
    }
}

// Function for handling errors
void SlaveFifoErrorHandler(CyU3PReturnStatus_t apiRetStatus) {
    // Infinite unresponsive loop (Fatal error)
    for(;;) {
        CyU3pThreadSleep(100);
    }
}

// Slave FIFO Application Initialization
void SlaveFifoAppInit() {
    CyU3PPibClock_t pibClock;
    CyU3PGpioClock_t gpioClock;
    CyU3PGpioSimpleConfig_t gpioConfig;
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

    // Initialize the GPIF block
    pibClock.clkDiv = 2;
    pibClock.clkSrc = CY_U3P_SYS_CLK;
    pibClock.isHalfDiv = CyFalse;
    pibClock.isDllEnable = CyFalse;
    apiRetStatus = CyU3PPibInit(CyTrue, &pibClock);

    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "GPIF Initialization failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Load the GPIF configuration for Slave FIFO sync mode
    apiRetStatus = CyU3PGpifLoad(&Sync_Slave_Fifo_2Bit_CyFxGpifConfig);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "Loading GPIF Configuration failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Start the state machine from Header Config file (obtained from GPIF II Designer)
    apiRetStatus = CyU3PGpifSMStart(RESET, ALPHA_RESET);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "State machine initialization failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }
	
	// Initialize the GPIO module
	gpioClock.fastClkDiv = 2;
	gpioClock.slowClkDiv = 0;
	gpioClock.simpleDiv = CY_U3P_GPIO_SIMPLE_DIV_BY_2;
	gpioClock.clkSrc = CY_U3P_SYS_CLK;
	gpioClock.halfDiv = 0;

	apiRetStatus = CyU3PGpioInit(&gpioClock, NULL);
	if (apiRetStatus != 0) {
		CyU3PDebugPrint(4, "GPIO Initialization failed, error code = %d\n", apiRetStatus);
		SlaveFifoErrorHandler(apiRetStatus);
	}

    // Start USB functionality
    apiRetStatus = CyU3PUsbStart();

    // USB automatic enumeration
    CyU3PUsbRegisterSetupCallback(CyFxSlFifoApplnUSBSetupCB, CyTrue);

    // Handle USB events with a callback
    CyU3PUsbRegisterEventCallback(CyFxSlFifoApplnUSBEventCB);

    // Handle LPM requests from USB 3.0 host
    CyU3PUsbRegisterLPMRequestCallback(CyFxApplnLPMRqtCB);

    // ----------------- Set USB descriptors -----------------

    // 1. SuperSpeed device descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_SS_DEVICE_DESCR, 0, (uint8_t*) CyFxUSB30DeviceDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // 2. High-speed device descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_HS_DEVICE_DESCR, 0, (uint8_t*) CyFxUSB20DeviceDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // BOS descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_SS_BOS_DESCR, 0, (uint8_t*) CyFxUSBBOSDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Device qualifier descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_DEVQUAL_DESCR, 0, (uint8_t*) CyFxUSBDeviceQualDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // SuperSpeed configuration descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_SS_CONFIG_DESCR, 0, (uint8_t*) CyFxUSBSSConfigDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // High-speed configuration descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_HS_CONFIG_DESCR, 0, (uint8_t*) CyFxUSBHSConfigDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "Descriptor failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Full speed configuration descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_FS_CONFIG_DESCR, 0, (uint8_t*) CyFxUSBFSConfigDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "Descriptor failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // String descriptor 0
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_STRING_DESCR, 0, (uint8_t*) CyFxUSBStringLangIDDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // String descriptor 1
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_STRING_DESCR, 1, (uint8_t*) CyFxUSBManufactureDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // String descriptor 2
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_STRING_DESCR, 2, (uint8_t*) CyFxUSBProductDscr);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Connect the USB Pins with SuperSpeed operation enabled
    apiRetStatus = CyU3PConnectState(CyTrue, CyTrue);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "USB Connect failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

}

// Start the Slave FIFO application (when the endpoints are set after receiving SET_CONFIGURATION request from USB)
void CyFxSlFifoApplnStart() {
    uint16_t size = 0;
    CyU3PEpConfig_t epCfg;
    CyU3PDmaChannelConfig_t dmaCfg;
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;
    CyU3PUSBSpeed_t usbSpeed = CyU3PUsbGetSpeed();

    // Set endpoint packet size based on bus speed
    switch (usbSpeed) {
        case CY_U3P_FULL_SPEED:
            size = 64;
            break;

        case CY_U3P_HIGH_SPEED:
            size = 512;
            break;

        case CY_U3P_SUPER_SPEED:
            size = 1024;
            break;

        default:
            CyU3PDebugPrint(4, "Error! Invalid USB speed.\n");
            SlaveFifoErrorHandler(CY_U3P_ERROR_FAILURE);
            break;
    }

    CyU3PMemSet((uint8_t*) &epCfg, 0, sizeof(epCfg));
    epCfg.enable = CyTrue;
    epCfg.epType = CY_U3P_USB_EP_BULK;
    epCfg.burstLen = 1;
    epCfg.streams = 0;
    epCfg.pcktSize = size;

    // Producer endpoint configuration
    apiRetStatus = CyU3PSetEpConfig(CY_FX_EP_PRODUCER, &epCfg);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "CyU3PSetEpConfig failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Consumer endpoint configuration
    apiRetStatus = CyU3PSetEpConfig(CY_FX_EP_CONSUMER, &epCfg);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "CyU3PSetEpConfig failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Creating a manual DMA channel based on the USB speed found above
    // Channel for P2U (GPIF to USB: Producer to Consumer)
    dmaCfg.size = size;
    dmaCfg.count = CY_FX_SLFIFO_DMA_BUF_COUNT;
    dmaCfg.prodSckId = CY_FX_PRODUCER_USB_SOCKET;
    dmaCfg.consSckId = CY_FX_CONSUMER_PPORT_SOCKET;
    dmaCfg.dmaMode = CY_U3P_DMA_MODE_BYTE;

    // Enable the callback for produce event
    dmaCfg.notification = CY_U3P_DMA_CB_PROD_EVENT;
    dmaCfg.cb = CyFxSlFifoUtoPDmaCallback;
    dmaCfg.prodHeader = 0;
    dmaCfg.prodFooter = 0;
    dmaCfg.consHeader = 0;
    dmaCfg.prodAvailCount = 0;
    apiRetStatus = CyU3PDmaChannelCreate(&glChHandleSlFifoUtoP, CY_U3P_DMA_TYPE_MANUAL, &dmaCfg);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "CyU3PDmaChannelCreate failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Channel for U2P (USB to GPIF)
    dmaCfg.prodSckId = CY_FX_PRODUCER_PPORT_SOCKET;
    dmaCfg.consSckId = CY_FX_CONSUMER_USB_SOCKET;
    dmaCfg.cb = CyFxSlFifoPtoUDmaCallback;

    apiRetStatus = CyU3PDmaChannelCreate(&glChHandleSlFifoPtoU, CY_U3P_DMA_TYPE_MANUAL, &dmaCfg);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "CyU3PDmaChannelCreate failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Flush the Endpoint memory
    CyU3PUsbFlushEp(CY_FX_EP_PRODUCER);
    CyU3PUsbFlushEp(CY_FX_EP_CONSUMER);

    // Set DMA channel transfer size
    apiRetStatus = CyU3PDmaChannelSetXfer (&glChHandleSlFifoUtoP, CY_FX_SLFIFO_DMA_TX_SIZE);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "CyU3PDmaChannelSetXfer Failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    apiRetStatus = CyU3PDmaChannelSetXfer(&glChHandleSlFifoPtoU, CY_FX_SLFIFO_DMA_RX_SIZE);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "CyU3PDmaChannelSetXfer Failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Update the status flag
    glIsApplnActive = CyTrue;
	CyU3PGpioSetValue(59, CyFalse);
}

// Callback function to respond to USB control requests
CyBool_t CyFxSlFifoApplnUSBSetupCB(uint32_t setupdat0, uint32_t setupdat1) {
    // Will probably have to change this as per example file
    return CyFalse;
}

// Callback function to handle USB events
void CyFxSlFifoApplnUSBEventCB (CyU3PUsbEventType_t evtype, uint16_t evdata) {
    switch (evtype) {
        case CY_U3P_USB_EVENT_SETCONF:
            // Disable the low power entry to optimize USB throughput
            CyU3PUsbLPMDisable();

            // Stop the application before re-starting
            if (glIsApplnActive) {
                CyFxSlFifoApplnStop();
            }

            // Start the loop back function
            CyFxSlFifoApplnStart();
            break;

        case CY_U3P_USB_EVENT_RESET:
        case CY_U3P_USB_EVENT_DISCONNECT:
            // Stop the loop back function
            if (glIsApplnActive) {
                CyFxSlFifoApplnStop();
            }
            break;

        default:
            break;
    }
}

// DMA callback function to handle callbacks during U to P transfers (GPIF to USB)
void CyFxSlFifoUtoPDmaCallback(CyU3PDmaChannel *chHandle, CyU3PDmaCbType_t type, CyU3PDmaCBInput_t *input) {
    CyU3PReturnStatus_t status = CY_U3P_SUCCESS;

    if (type == CY_U3P_DMA_CB_PROD_EVENT) {
        status = CyU3PDmaChannelCommitBuffer(chHandle, input->buffer_p.count, 0);
        if (status != CY_U3P_SUCCESS) {
            CyU3PDebugPrint (4, "CyU3PDmaChannelCommitBuffer failed, Error code = %d\n", status);
        }

        glDMARxCount++;
    }
}

// DMA callback function to handle callbacks during U to P transfers (GPIF to USB)
void CyFxSlFifoPtoUDmaCallback (CyU3PDmaChannel *chHandle, CyU3PDmaCbType_t type, CyU3PDmaCBInput_t *input) {
    CyU3PReturnStatus_t status = CY_U3P_SUCCESS;

    if (type == CY_U3P_DMA_CB_PROD_EVENT) {
        status = CyU3PDmaChannelCommitBuffer(chHandle, input->buffer_p.count, 0);
        if (status != CY_U3P_SUCCESS) {
            CyU3PDebugPrint(4, "CyU3PDmaChannelCommitBuffer failed, Error code = %d\n", status);
        }

        glDMATxCount++;
    }
}

// Stop Slave FIFO application (when RESET or DISCONNECT is received for USB host)
void CyFxSlFifoApplnStop() {
    CyU3PEpConfig_t epCfg;
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

    glIsApplnActive = CyFalse;

    // Flush the endpoint memory
    CyU3PUsbFlushEp(CY_FX_EP_PRODUCER);
    CyU3PUsbFlushEp(CY_FX_EP_CONSUMER);

    // Destroy the channel
    CyU3PDmaChannelDestroy(&glChHandleSlFifoUtoP);
    CyU3PDmaChannelDestroy(&glChHandleSlFifoPtoU);

    // Disable endpoints
    CyU3PMemSet((uint8_t*) &epCfg, 0, sizeof(epCfg));
    epCfg.enable = CyFalse;

    // Producer endpoint configuration
    apiRetStatus = CyU3PSetEpConfig(CY_FX_EP_PRODUCER, &epCfg);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "CyU3PSetEpConfig failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Consumer endpoint configuration
    apiRetStatus = CyU3PSetEpConfig(CY_FX_EP_CONSUMER, &epCfg);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint(4, "CyU3PSetEpConfig failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }
}

// Function to handle LPM callbacks
CyBool_t CyFxApplnLPMRqtCB (CyU3PUsbLinkPowerMode link_mode) {
    return CyTrue;
}

// Main Application Program
void main() {

    CyU3PReturnStatus_t status = CY_U3P_SUCCESS;
    CyU3PIoMatrixConfig_t io_cfg;
    CyU3PSysClockConfig_t clockConfig;

    // First step in the firmware: Device initialization
    // CPU clock is set up (Passing NULL selects default clock configuration) and Vectored Interrupt Controller is configured
    if (CY_FX_SLFIFO_GPIF_16_32BIT_CONF_SELECT == 0) {
        clockConfig.setSysClk400 = CyFalse;
    } else {
        clockConfig.setSysClk400 = CyTrue;
    }
    clockConfig.cpuClkDiv = 2;
    clockConfig.dmaClkDiv = 2;
    clockConfig.mmioClkDiv = 2;
    clockConfig.useStandbyClk = CyFalse;
    clockConfig.clkSrc = CY_U3P_SYS_CLK;

    status = CyU3PDeviceInit(&clockConfig);
    if (status != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(status);
    }

    // Second step: Enable device caches (8kB data cache and 8kB instruction cache)
    status = CyU3PDeviceCacheControl(CyTrue, CyFalse, CyFalse);
    if (status != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(status);
    }

    // Third step: Configuration of required IO ports (In our case, SPI and GPIF)
    io_cfg.useI2C = CyFalse;
    io_cfg.useI2S = CyFalse;
    io_cfg.useSpi = CyTrue;
    io_cfg.useUart = CyFalse;

    // Toggle GPIF in either 16-bit or 32-bit mode
    if (CY_FX_SLFIFO_GPIF_16_32BIT_CONF_SELECT == 0) {
        io_cfg.isDQ32Bit = CyFalse;
        io_cfg.lppMode = CY_U3P_IO_MATRIX_LPP_SPI_ONLY;
    } else {
        io_cfg.isDQ32Bit = CyTrue;
        io_cfg.lppMode = CY_U3P_IO_MATRIX_LPP_DEFAULT;
    }

    io_cfg.gpioSimpleEn[0]  = 0;
    io_cfg.gpioSimpleEn[1]  = 0x08000000;
    io_cfg.gpioComplexEn[0] = 0;
    io_cfg.gpioComplexEn[1] = 0;

    io_cfg.s0Mode = CY_U3P_SPORT_INACTIVE;
    io_cfg.s1Mode = CY_U3P_SPORT_INACTIVE;

    // Initialize the IO matrix configuration data structure
    status = CyU3PDeviceConfigureIOMatrix(&io_cfg);
    if (status != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(status);
    }

    // Initializing the RTOS via its wrapper, and starting the OS timer
    // Transfer the control to the RTOS scheduler
    CyU3PKernelEntry();

    /*
    // Fatal error: Infinite unresponsive loop
    handle_fatal_error:
        while(1);
    */
}