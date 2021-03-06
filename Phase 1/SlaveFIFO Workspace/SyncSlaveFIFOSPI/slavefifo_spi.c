#include "cyu3error.h"
#include "slavefifo_spi.h"
#include "cyu3gpif.h"
#include "cyu3pib.h"
#include "pib_regs.h"
#include "cyu3uart.h"
#include "cyu3utils.h"
#include "cyu3system.h"
#include "cyfxgpifconfig.h"
#include "cyu3spi.h"
#include "cyu3gpio.h"
// #include "cyfx3_api.h"
#include "cyu3dma.h"
#include "cyu3usb.h"
#include "cyu3system.h"
// #include "stdlib.h"
#include "cyu3os.h"
// #include "cyfxgpif_syncsf.h"

/* Firmware ID variable that may be used to verify SPI firmware. */
const uint8_t glFirmwareID[32] __attribute__ ((aligned (32))) = { 'F', 'X', '3', ' ', 'S', 'P', 'I', '\0' };

uint8_t glEp0Buffer[4096] __attribute__ ((aligned (32)));

uint32_t glDMARxCount = 0;               // Number of buffers received from USB
uint32_t glDMATxCount = 0;               // Number of buffers sent to USB
CyBool_t glIsApplnActive = CyFalse;      // Check if loopback application is active
uint16_t glSpiPageSize = 0x1;  		 	 // SPI Page size to be used for transfers (16 bit)
uint8_t burstLength = 0;

CyU3PDmaChannel glChHandleSlFifoUtoP;    // DMA Channel handle for U2P transfer
CyU3PThread slFifoAppThread;             // Application's thread structure
CyU3PDmaChannel glChHandleSlFifoPtoU;    // DMA Channel handle for P2U transfer
CyU3PDmaChannel glSpiTxHandle;   		 // SPI Transmitter channel handle
CyU3PDmaChannel glSpiRxHandle;   		 // SPI Receiver channel handle

// Function for handling errors
void SlaveFifoErrorHandler(CyU3PReturnStatus_t apiRetStatus) {
    // Infinite unresponsive loop (Fatal error)
    for(;;) {
        CyU3PThreadSleep(100);
    }
}

// Debug mechanism function
void SlaveFifoAppDebugInit() {
    CyU3PUartConfig_t uartConfig;
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

    /* Initialize the UART for printing debug messages */
    apiRetStatus = CyU3PUartInit();
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        /* Error handling */
        SlaveFifoErrorHandler(apiRetStatus);
    }

    /* Set UART configuration */
    CyU3PMemSet ((uint8_t *)&uartConfig, 0, sizeof (uartConfig));
    uartConfig.baudRate = CY_U3P_UART_BAUDRATE_115200;
    uartConfig.stopBit = CY_U3P_UART_ONE_STOP_BIT;
    uartConfig.parity = CY_U3P_UART_NO_PARITY;
    uartConfig.txEnable = CyTrue;
    uartConfig.rxEnable = CyFalse;
    uartConfig.flowCtrl = CyFalse;
    uartConfig.isDma = CyTrue;

    apiRetStatus = CyU3PUartSetConfig (&uartConfig, NULL);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        SlaveFifoErrorHandler(apiRetStatus);
    }

    /* Set the UART transfer to a really large value. */
    apiRetStatus = CyU3PUartTxSetBlockXfer (0xFFFFFFFF);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        SlaveFifoErrorHandler(apiRetStatus);
    }

    /* Initialize the debug module. */
    apiRetStatus = CyU3PDebugInit (CY_U3P_LPP_SOCKET_UART_CONS, 8);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        SlaveFifoErrorHandler(apiRetStatus);
    }
}

// SPI initialization for application
CyU3PReturnStatus_t CyFxSpiInit () {
    CyU3PSpiConfig_t spiConfig;
    // CyU3PDmaChannelConfig_t dmaConfig;
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

    /* Start the SPI module and configure the master. */
    apiRetStatus = CyU3PSpiInit();
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
    	SlaveFifoErrorHandler(apiRetStatus);
    }

    /* Start the SPI master block. Run the SPI clock at 8MHz
     * and configure the word length to 8 bits. Also configure
     * the slave select using FW. */
    CyU3PMemSet ((uint8_t *)&spiConfig, 0, sizeof(spiConfig));
    spiConfig.isLsbFirst = CyFalse;
    spiConfig.cpol       = CyTrue;
    spiConfig.ssnPol     = CyFalse;
    spiConfig.cpha       = CyFalse;
    spiConfig.leadTime   = CY_U3P_SPI_SSN_LAG_LEAD_HALF_CLK;
    spiConfig.lagTime    = CY_U3P_SPI_SSN_LAG_LEAD_HALF_CLK;
    spiConfig.ssnCtrl    = CY_U3P_SPI_SSN_CTRL_FW;
    spiConfig.clock      = 8000000;
    spiConfig.wordLen    = 8;

    apiRetStatus = CyU3PSpiSetConfig (&spiConfig, NULL);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
    	SlaveFifoErrorHandler(apiRetStatus);
    }

    return apiRetStatus;
}

/*
// Wait for the status response from the SPI flash
CyU3PReturnStatus_t CyFxSpiWaitForStatus (void) {
    uint8_t buf[2], rd_buf[2];
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

    // Wait for status response from SPI flash device
    do {
        buf[0] = 0x06;  // Write enable command

        CyU3PSpiSetSsnLine (CyFalse);
        apiRetStatus = CyU3PSpiTransmitWords (buf, 1);
        CyU3PSpiSetSsnLine (CyTrue);
        if (apiRetStatus != CY_U3P_SUCCESS) {
            CyU3PDebugPrint (2, "SPI WR_ENABLE command failed\n\r");
            SlaveFifoErrorHandler(apiRetStatus);
        }

        buf[0] = 0x05;  // Read status command

        CyU3PSpiSetSsnLine (CyFalse);
        apiRetStatus = CyU3PSpiTransmitWords (buf, 1);
        if (apiRetStatus != CY_U3P_SUCCESS) {
            CyU3PDebugPrint (2, "SPI READ_STATUS command failed\n\r");
            CyU3PSpiSetSsnLine (CyTrue);
            SlaveFifoErrorHandler(apiRetStatus);
        }

        apiRetStatus = CyU3PSpiReceiveWords (rd_buf, 2);
        CyU3PSpiSetSsnLine (CyTrue);
        if(apiRetStatus != CY_U3P_SUCCESS) {
            CyU3PDebugPrint (2, "SPI status read failed\n\r");
            SlaveFifoErrorHandler(apiRetStatus);
        }

    } while ((rd_buf[0] & 1)|| (!(rd_buf[0] & 0x2)));

    return CY_U3P_SUCCESS;
}
*/

// SPI read / write for programmer application
CyU3PReturnStatus_t CyFxSpiTransfer (uint16_t pageAddress, uint16_t byteCount, uint8_t *buffer, CyBool_t isRead) {
    // CyU3PDmaBuffer_t buf_p;
    uint8_t location[4];
    uint32_t byteAddress = 0;
    uint16_t pageCount = (byteCount / glSpiPageSize);
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

    if (byteCount == 0) {
        return CY_U3P_SUCCESS;
    }

    if ((byteCount % glSpiPageSize) != 0) {
        pageCount ++;
    }

    // buf_p.buffer = buffer;
    // buf_p.status = 0;

    byteAddress  = pageAddress * glSpiPageSize;
    // CyU3PDebugPrint (2, "SPI access - addr: 0x%x, size: 0x%x, pages: 0x%x.\r\n",
    //         byteAddress, byteCount, pageCount);

    while (pageCount != 0) {
        location[1] = glSpiPageSize;       // Length of the SPI transfer
        location[2] = (byteAddress >> 8) & 0xFF;
        location[3] = byteAddress & 0xFF;               // LS byte

        if (isRead) {
            location[0] = 0x03; // Read command

            /*
            buf_p.size  = glSpiPageSize;
            buf_p.count = glSpiPageSize;

            apiRetStatus = CyFxSpiWaitForStatus ();

            if (apiRetStatus != CY_U3P_SUCCESS)
            	SlaveFifoErrorHandler(apiRetStatus);
            */

            CyU3PSpiSetSsnLine (CyFalse);
            apiRetStatus = CyU3PSpiTransmitWords (location, 4);
            if (apiRetStatus != CY_U3P_SUCCESS) {
                // CyU3PDebugPrint (2, "SPI READ command failed\r\n");
                CyU3PSpiSetSsnLine (CyTrue);
                SlaveFifoErrorHandler(apiRetStatus);
            }

            /*
            CyU3PSpiSetBlockXfer (0, glSpiPageSize);
            apiRetStatus = CyU3PDmaChannelSetupRecvBuffer (&glSpiRxHandle, &buf_p);
            if (apiRetStatus != CY_U3P_SUCCESS) {
                CyU3PSpiSetSsnLine (CyTrue);
                SlaveFifoErrorHandler(apiRetStatus);
            }

            apiRetStatus = CyU3PDmaChannelWaitForCompletion (&glSpiRxHandle, CY_FX_USB_SPI_TIMEOUT);
            if (apiRetStatus != CY_U3P_SUCCESS) {
                CyU3PSpiSetSsnLine (CyTrue);
                SlaveFifoErrorHandler(apiRetStatus);
            }
            */

           apiRetStatus = CyU3PSpiTransmitWords (buffer, glSpiPageSize);
            if (apiRetStatus != CY_U3P_SUCCESS) {
                CyU3PSpiSetSsnLine (CyTrue);
                return apiRetStatus;
            }

            CyU3PSpiSetSsnLine (CyTrue);
            // CyU3PSpiDisableBlockXfer (CyFalse, CyTrue);
        }

        /*
        // Write
        else {
            location[0] = 0x02; // Write command

            buf_p.size  = glSpiPageSize;
            buf_p.count = glSpiPageSize;

            apiRetStatus = CyFxSpiWaitForStatus ();
            if (apiRetStatus != CY_U3P_SUCCESS)
            	SlaveFifoErrorHandler(apiRetStatus);
            CyU3PSpiSetSsnLine (CyFalse);

            apiRetStatus = CyU3PSpiTransmitWords (location, 4);
            if (apiRetStatus != CY_U3P_SUCCESS) {
                CyU3PDebugPrint (2, "SPI WRITE command failed\r\n");
                CyU3PSpiSetSsnLine (CyTrue);
                SlaveFifoErrorHandler(apiRetStatus);
            }

            CyU3PSpiSetBlockXfer (glSpiPageSize, 0);

            apiRetStatus = CyU3PDmaChannelSetupSendBuffer (&glSpiTxHandle, &buf_p);
            if (apiRetStatus != CY_U3P_SUCCESS) {
                CyU3PSpiSetSsnLine (CyTrue);
                SlaveFifoErrorHandler(apiRetStatus);
            }

            apiRetStatus = CyU3PDmaChannelWaitForCompletion(&glSpiTxHandle, CY_FX_USB_SPI_TIMEOUT);
            if (apiRetStatus != CY_U3P_SUCCESS) {
                CyU3PSpiSetSsnLine (CyTrue);
                SlaveFifoErrorHandler(apiRetStatus);
            }

            CyU3PSpiSetSsnLine (CyTrue);
            CyU3PSpiDisableBlockXfer (CyTrue, CyFalse);
        }
        */

        /* Update the parameters */
        byteAddress  += glSpiPageSize;
        buffer += glSpiPageSize;
        pageCount --;

        CyU3PThreadSleep (10);
    }
    return CY_U3P_SUCCESS;
}

/*
// Function to erase SPI flash sectors
static CyU3PReturnStatus_t CyFxSpiEraseSector (CyBool_t isErase, uint8_t sector, uint8_t *wip) {
    uint32_t temp = 0;
    uint8_t location[4], rdBuf[2];
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

    if ((!isErase) && (wip == NULL)) {
        return CY_U3P_ERROR_BAD_ARGUMENT;
    }

    location[0] = 0x06;  // Write enable

    CyU3PSpiSetSsnLine (CyFalse);
    apiRetStatus = CyU3PSpiTransmitWords (location, 1);
    CyU3PSpiSetSsnLine (CyTrue);
    if (apiRetStatus != CY_U3P_SUCCESS)
    	SlaveFifoErrorHandler(apiRetStatus);

    if (isErase) {
        location[0] = 0xD8; // Sector erase
        temp        = sector * 0x10000;
        location[1] = (temp >> 16) & 0xFF;
        location[2] = (temp >> 8) & 0xFF;
        location[3] = temp & 0xFF;

        CyU3PSpiSetSsnLine (CyFalse);
        apiRetStatus = CyU3PSpiTransmitWords (location, 4);
        CyU3PSpiSetSsnLine (CyTrue);
    } else {
        location[0] = 0x05; // Read status

        CyU3PSpiSetSsnLine (CyFalse);
        apiRetStatus = CyU3PSpiTransmitWords (location, 1);
        if (apiRetStatus != CY_U3P_SUCCESS) {
            CyU3PSpiSetSsnLine (CyTrue);
            SlaveFifoErrorHandler(apiRetStatus);
        }

        apiRetStatus = CyU3PSpiReceiveWords (rdBuf, 2);
        CyU3PSpiSetSsnLine (CyTrue);
        *wip = rdBuf[0] & 0x1;
    }

    return apiRetStatus;
}
*/

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

// DMA callback function to handle callbacks during P to U transfers (GPIF to USB)
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


void SlaveFifoAppStart(void) {
    uint16_t size = 0;
    CyU3PEpConfig_t epCfg;
    CyU3PDmaChannelConfig_t dmaCfg;
    // CyU3PSpiConfig_t spiConfig;
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;
    CyU3PUSBSpeed_t usbSpeed = CyU3PUsbGetSpeed();

    // Set endpoint packet size based on bus speed
    switch (usbSpeed) {
        case CY_U3P_FULL_SPEED:
            size = 64;
            break;

        case CY_U3P_HIGH_SPEED:
            size = 512;
            burstLength = 1;
            break;

        case CY_U3P_SUPER_SPEED:
            size = 1024;
            burstLength = 16;
            break;

        default:
            CyU3PDebugPrint(4, "Error! Invalid USB speed.\n");
            SlaveFifoErrorHandler(CY_U3P_ERROR_FAILURE);
            break;
    }

    CyU3PMemSet ((uint8_t *)&epCfg, 0, sizeof (epCfg));
    epCfg.enable = CyTrue;
    epCfg.epType = CY_U3P_USB_EP_BULK;
#ifdef STREAM_IN_OUT
    epCfg.burstLen = burstLength;
#else
    epCfg.burstLen = 1;
#endif
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

#ifdef MANUAL
    /* Create a DMA MANUAL channel for U2P transfer.
     * DMA size is set based on the USB speed. */
    dmaCfg.size  = DMA_BUF_SIZE* size;
    dmaCfg.count = CY_FX_SLFIFO_DMA_BUF_COUNT_U_2_P;
    dmaCfg.prodSckId = CY_FX_PRODUCER_USB_SOCKET;
    dmaCfg.consSckId = CY_FX_CONSUMER_PPORT_SOCKET;
    dmaCfg.dmaMode = CY_U3P_DMA_MODE_BYTE;
    /* Enabling the callback for produce event. */
    dmaCfg.notification = CY_U3P_DMA_CB_PROD_EVENT;
    dmaCfg.cb = CyFxSlFifoUtoPDmaCallback;
    dmaCfg.prodHeader = 0;
    dmaCfg.prodFooter = 0;
    dmaCfg.consHeader = 0;
    dmaCfg.prodAvailCount = 0;

    apiRetStatus = CyU3PDmaChannelCreate (&glChHandleSlFifoUtoP,
            CY_U3P_DMA_TYPE_MANUAL, &dmaCfg);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "CyU3PDmaChannelCreate failed, Error code = %d\n", apiRetStatus);
        CyFxAppErrorHandler(apiRetStatus);
    }

    /* Create a DMA MANUAL channel for P2U transfer. */
    dmaCfg.prodSckId = CY_FX_PRODUCER_PPORT_SOCKET;
    dmaCfg.consSckId = CY_FX_CONSUMER_USB_SOCKET;
    dmaCfg.count = CY_FX_SLFIFO_DMA_BUF_COUNT_P_2_U;
    dmaCfg.cb = CyFxSlFifoPtoUDmaCallback;
    apiRetStatus = CyU3PDmaChannelCreate (&glChHandleSlFifoPtoU,
            CY_U3P_DMA_TYPE_MANUAL, &dmaCfg);

#else
    /* Create a DMA AUTO channel for U2P transfer.
       DMA size is set based on the USB speed. */
    dmaCfg.size  = DMA_BUF_SIZE * size;
    dmaCfg.count = CY_FX_SLFIFO_DMA_BUF_COUNT_U_2_P;
	dmaCfg.prodSckId = CY_FX_PRODUCER_USB_SOCKET;
    dmaCfg.consSckId = CY_FX_CONSUMER_PPORT_SOCKET;
    dmaCfg.dmaMode = CY_U3P_DMA_MODE_BYTE;
    /* Enabling the callback for produce event. */
    dmaCfg.notification = 0;
    dmaCfg.cb = 0;
    dmaCfg.prodHeader = 0;
    dmaCfg.prodFooter = 0;
    dmaCfg.consHeader = 0;
    dmaCfg.prodAvailCount = 0;

    apiRetStatus = CyU3PDmaChannelCreate (&glChHandleSlFifoUtoP,
               CY_U3P_DMA_TYPE_AUTO, &dmaCfg);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
       CyU3PDebugPrint (4, "CyU3PDmaChannelCreate failed, Error code = %d\n", apiRetStatus);
       SlaveFifoErrorHandler(apiRetStatus);
    }

    /* Create a DMA AUTO channel for P2U transfer. */
    dmaCfg.size  = DMA_BUF_SIZE * size; //increase buffer size for higher performance
    dmaCfg.count = CY_FX_SLFIFO_DMA_BUF_COUNT_P_2_U; // increase buffer count for higher performance
    dmaCfg.prodSckId = CY_FX_PRODUCER_PPORT_SOCKET;
    dmaCfg.consSckId = CY_FX_CONSUMER_USB_SOCKET;
    dmaCfg.cb = 0;
    apiRetStatus = CyU3PDmaChannelCreate (&glChHandleSlFifoPtoU,
               CY_U3P_DMA_TYPE_AUTO, &dmaCfg);

    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "CyU3PDmaChannelCreate failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

#endif

    // Flush the Endpoint memory
    CyU3PUsbFlushEp(CY_FX_EP_PRODUCER);
    CyU3PUsbFlushEp(CY_FX_EP_CONSUMER);

    // Set DMA channel transfer size
    apiRetStatus = CyU3PDmaChannelSetXfer(&glChHandleSlFifoUtoP, CY_FX_SLFIFO_DMA_TX_SIZE);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "CyU3PDmaChannelSetXfer Failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    apiRetStatus = CyU3PDmaChannelSetXfer(&glChHandleSlFifoPtoU, CY_FX_SLFIFO_DMA_RX_SIZE);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "CyU3PDmaChannelSetXfer Failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Update the status flag
    glIsApplnActive = CyTrue;
	CyU3PGpioSetValue (59, CyFalse);

}

// Stop Slave FIFO application (when RESET or DISCONNECT is received for USB host)
void SlaveFifoAppStop() {
    CyU3PEpConfig_t epCfg;
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

    glIsApplnActive = CyFalse;

    // Flush the endpoint memory
    CyU3PUsbFlushEp(CY_FX_EP_PRODUCER);
    CyU3PUsbFlushEp(CY_FX_EP_CONSUMER);

    // Reset the SPI DMA channels
    CyU3PDmaChannelReset (&glSpiTxHandle);
    CyU3PDmaChannelReset (&glSpiRxHandle);

    // Destroy the channel
    CyU3PDmaChannelDestroy(&glChHandleSlFifoUtoP);
    CyU3PDmaChannelDestroy(&glChHandleSlFifoPtoU);

    // Disable endpoints
    CyU3PMemSet ((uint8_t *)&epCfg, 0, sizeof (epCfg));
    epCfg.enable = CyFalse;

    // Producer endpoint configuration
    apiRetStatus = CyU3PSetEpConfig(CY_FX_EP_PRODUCER, &epCfg);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "CyU3PSetEpConfig failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Consumer endpoint configuration
    apiRetStatus = CyU3PSetEpConfig(CY_FX_EP_CONSUMER, &epCfg);
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "CyU3PSetEpConfig failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }
}

// Callback function to respond to USB control requests
CyBool_t CyFxSlFifoApplnUSBSetupCB(uint32_t setupdat0, uint32_t setupdat1) {
	uint8_t  bRequest, bReqType;
	uint8_t  bType, bTarget;
	uint16_t wValue, wIndex, wLength;
	CyBool_t isHandled = CyFalse;
	CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;

	bReqType = (setupdat0 & CY_U3P_USB_REQUEST_TYPE_MASK);
	bType    = (bReqType & CY_U3P_USB_TYPE_MASK);
	bTarget  = (bReqType & CY_U3P_USB_TARGET_MASK);
	bRequest = ((setupdat0 & CY_U3P_USB_REQUEST_MASK) >> CY_U3P_USB_REQUEST_POS);
	wValue   = ((setupdat0 & CY_U3P_USB_VALUE_MASK) >> CY_U3P_USB_VALUE_POS);
	wIndex   = ((setupdat1 & CY_U3P_USB_INDEX_MASK) >> CY_U3P_USB_INDEX_POS);
	wLength  = ((setupdat1 & CY_U3P_USB_LENGTH_MASK) >> CY_U3P_USB_LENGTH_POS);

	if (bType == CY_U3P_USB_STANDARD_RQT) {
	    if ((bTarget == CY_U3P_USB_TARGET_INTF) && ((bRequest == CY_U3P_USB_SC_SET_FEATURE)
	                || (bRequest == CY_U3P_USB_SC_CLEAR_FEATURE)) && (wValue == 0))
	    {
	        if (glIsApplnActive)
	            CyU3PUsbAckSetup ();
	        else
	            CyU3PUsbStall (0, CyTrue, CyFalse);
	        isHandled = CyTrue;
	    }

	    if ((bTarget == CY_U3P_USB_TARGET_ENDPT) && (bRequest == CY_U3P_USB_SC_CLEAR_FEATURE)
	            && (wValue == CY_U3P_USBX_FS_EP_HALT)) {
	        if (glIsApplnActive) {
	            if (wIndex == CY_FX_EP_PRODUCER) {
	                // CyU3PUsbSetEpNak (CY_FX_EP_PRODUCER, CyTrue);
	                // CyU3PBusyWait (125);
	                CyU3PDmaChannelReset (&glChHandleSlFifoUtoP);
	                CyU3PUsbFlushEp(CY_FX_EP_PRODUCER);
	                CyU3PUsbResetEp (CY_FX_EP_PRODUCER);
	                CyU3PDmaChannelSetXfer (&glChHandleSlFifoUtoP, CY_FX_SLFIFO_DMA_TX_SIZE);
	                // CyU3PUsbSetEpNak (CY_FX_EP_PRODUCER, CyFalse);
	            }
	            if (wIndex == CY_FX_EP_CONSUMER) {
	                // CyU3PUsbSetEpNak (CY_FX_EP_PRODUCER, CyTrue);
	                // CyU3PBusyWait (125);
	                CyU3PDmaChannelReset (&glChHandleSlFifoPtoU);
	                CyU3PUsbFlushEp(CY_FX_EP_CONSUMER);
	                CyU3PUsbResetEp (CY_FX_EP_CONSUMER);
	                CyU3PDmaChannelSetXfer (&glChHandleSlFifoPtoU, CY_FX_SLFIFO_DMA_RX_SIZE);
	                // CyU3PUsbSetEpNak (CY_FX_EP_PRODUCER, CyFalse);
	            }
	            CyU3PUsbStall (wIndex, CyFalse, CyTrue);
	            // CyU3PUsbAckSetup ();
	            isHandled = CyTrue;
	        }
	    }
	}

    /* Handle supported vendor requests. */
    if (bType == CY_U3P_USB_VENDOR_RQT)
    {
        isHandled = CyTrue;

        switch (bRequest)
        {
            case CY_FX_RQT_ID_CHECK:
                CyU3PUsbSendEP0Data (8, (uint8_t *)glFirmwareID);
                break;

            case CY_FX_RQT_SPI_FLASH_WRITE:
            	apiRetStatus = CyU3PUsbGetEP0Data (wLength, glEp0Buffer, NULL);
                if (apiRetStatus == CY_U3P_SUCCESS)
                {
                	apiRetStatus = CyFxSpiTransfer (wIndex, wLength,
                            glEp0Buffer, CyFalse);
                }
                break;

            case CY_FX_RQT_SPI_FLASH_READ:
                CyU3PMemSet (glEp0Buffer, 0, sizeof (glEp0Buffer));
                apiRetStatus = CyFxSpiTransfer (wIndex, wLength,
                        glEp0Buffer, CyTrue);
                if (apiRetStatus == CY_U3P_SUCCESS)
                {
                	apiRetStatus = CyU3PUsbSendEP0Data (wLength, glEp0Buffer);
                }
                break;

                /*
            case CY_FX_RQT_SPI_FLASH_ERASE_POLL:
            	apiRetStatus = CyFxSpiEraseSector ((wValue) ? CyTrue : CyFalse,
                        (wIndex & 0xFF), glEp0Buffer);
                if (apiRetStatus == CY_U3P_SUCCESS)
                {
                    if (wValue == 0)
                    {
                    	apiRetStatus = CyU3PUsbSendEP0Data (wLength, glEp0Buffer);
                    }
                    else
                    {
                        CyU3PUsbAckSetup ();
                    }
                }
                break;
                */

            default:
                /* This is unknown request. */
                isHandled = CyFalse;
                break;
        }

        /* If there was any error, return not handled so that the library will
         * stall the request. Alternatively EP0 can be stalled here and return
         * CyTrue. */
        if (apiRetStatus != CY_U3P_SUCCESS) {
            isHandled = CyFalse;
        }
    }

	return isHandled;
}

// Callback function to handle USB events
void CyFxSlFifoApplnUSBEventCB (CyU3PUsbEventType_t evtype, uint16_t evdata) {
    switch (evtype) {
        case CY_U3P_USB_EVENT_SETCONF:
            // Disable the low power entry to optimize USB throughput
            

            // Stop the application before re-starting
            if (glIsApplnActive) {
                SlaveFifoAppStop();
            }
            CyU3PUsbLPMDisable();

            // Start the loop back function
            SlaveFifoAppStart();
            break;
        // case CY_U3P_USB_EVENT_RESET:
        case CY_U3P_USB_EVENT_DISCONNECT:
            // Stop the loop back function
            if (glIsApplnActive) {
                SlaveFifoAppStop();
            }
            break;

        default:
            break;
    }
}

// Function to handle LPM callbacks
CyBool_t CyFxApplnLPMRqtCB (CyU3PUsbLinkPowerMode link_mode) {
    return CyTrue;
}

void
gpif_error_cb(CyU3PPibIntrType cbType, uint16_t cbArg)
{

if(cbType==CYU3P_PIB_INTR_ERROR)
{
    switch (CYU3P_GET_PIB_ERROR_TYPE(cbArg))
    {
        case CYU3P_PIB_ERR_THR0_WR_OVERRUN:
        CyU3PDebugPrint (4, "CYU3P_PIB_ERR_THR0_WR_OVERRUN");
        break;
        case CYU3P_PIB_ERR_THR1_WR_OVERRUN:
        CyU3PDebugPrint (4, "CYU3P_PIB_ERR_THR1_WR_OVERRUN");
        break;
        case CYU3P_PIB_ERR_THR2_WR_OVERRUN:
        CyU3PDebugPrint (4, "CYU3P_PIB_ERR_THR2_WR_OVERRUN");
        break;
        case CYU3P_PIB_ERR_THR3_WR_OVERRUN:
        CyU3PDebugPrint (4, "CYU3P_PIB_ERR_THR3_WR_OVERRUN");
        break;

        case CYU3P_PIB_ERR_THR0_RD_UNDERRUN:
        CyU3PDebugPrint (4, "CYU3P_PIB_ERR_THR0_RD_UNDERRUN");
        break;
        case CYU3P_PIB_ERR_THR1_RD_UNDERRUN:
        CyU3PDebugPrint (4, "CYU3P_PIB_ERR_THR1_RD_UNDERRUN");
        break;
        case CYU3P_PIB_ERR_THR2_RD_UNDERRUN:
        CyU3PDebugPrint (4, "CYU3P_PIB_ERR_THR2_RD_UNDERRUN");
        break;
        case CYU3P_PIB_ERR_THR3_RD_UNDERRUN:
        CyU3PDebugPrint (4, "CYU3P_PIB_ERR_THR3_RD_UNDERRUN");
        break;

        default:
        CyU3PDebugPrint (4, "No Error :%d\n ",CYU3P_GET_PIB_ERROR_TYPE(cbArg));
            break;
    }
}

}

// Slave FIFO Application Initialization: Initializes GPIF and USB interfaces
void CyFxSlFifoApplnInit() {
    CyU3PPibClock_t pibClock;
    CyU3PReturnStatus_t apiRetStatus = CY_U3P_SUCCESS;
    CyU3PGpioClock_t gpioClock;
    CyU3PGpioSimpleConfig_t gpioConfig;

    // Initialize the SPI interface for flash of page size 16 bytes.
    apiRetStatus = CyFxSpiInit ();
    if (apiRetStatus != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Initialize the GPIF block
    pibClock.clkDiv = 2;
    pibClock.clkSrc = CY_U3P_SYS_CLK;
    pibClock.isHalfDiv = CyFalse;
    pibClock.isDllEnable = CyFalse;
    apiRetStatus = CyU3PPibInit(CyTrue, &pibClock);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "GPIF Initialization failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Load the GPIF configuration for Slave FIFO sync mode
    apiRetStatus = CyU3PGpifLoad (&CyFxGpifConfig);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "Loading GPIF Configuration failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

#if (CY_FX_SLFIFO_GPIF_16_32BIT_CONF_SELECT == 1)
	CyU3PGpifSocketConfigure (0,CY_U3P_PIB_SOCKET_0,6,CyFalse,1);
	CyU3PGpifSocketConfigure (3,CY_U3P_PIB_SOCKET_3,6,CyFalse,1);
#else
	CyU3PGpifSocketConfigure (0,CY_U3P_PIB_SOCKET_0,3,CyFalse,1);
	CyU3PGpifSocketConfigure (3,CY_U3P_PIB_SOCKET_3,3,CyFalse,1);
#endif

    // Start the state machine from Header Config file (obtained from GPIF II Designer)
    apiRetStatus = CyU3PGpifSMStart (RESET, ALPHA_RESET);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
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
	if (apiRetStatus != 0)
	{
		CyU3PDebugPrint(4, "GPIO Initialization failed, error code = %d\n", apiRetStatus);
		SlaveFifoErrorHandler(apiRetStatus);
	}

	/* Configure GPIO 59 as output */
	gpioConfig.outValue = CyTrue;
	gpioConfig.driveLowEn = CyTrue;
	gpioConfig.driveHighEn = CyTrue;
	gpioConfig.inputEn = CyFalse;
	gpioConfig.intrMode = CY_U3P_GPIO_NO_INTR;
	apiRetStatus = CyU3PGpioSetSimpleConfig(59, &gpioConfig);
	if (apiRetStatus != CY_U3P_SUCCESS) {
		/* Error handling */
	    CyU3PDebugPrint (4, "CyU3PGpioSetSimpleConfig failed, error code = %d\n",apiRetStatus);
	    SlaveFifoErrorHandler(apiRetStatus);
	}

    // Initialize the SPI interface for flash of page size 256 bytes
	apiRetStatus = CyFxSpiInit (0x100);
    if (apiRetStatus != CY_U3P_SUCCESS) {
    	SlaveFifoErrorHandler(apiRetStatus);
    }

    // Start USB functionality
    apiRetStatus = CyU3PUsbStart();
    if (apiRetStatus != CY_U3P_SUCCESS) {
        CyU3PDebugPrint (4, "CyU3PUSB failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Callback to see if there is any overflow of data on the GPIF II side
    CyU3PPibRegisterCallback(gpif_error_cb,0xffff);

    // USB automatic enumeration
    CyU3PUsbRegisterSetupCallback(CyFxSlFifoApplnUSBSetupCB, CyTrue);

    // Handle USB events with a callback
    CyU3PUsbRegisterEventCallback(CyFxSlFifoApplnUSBEventCB);

    // Handle LPM requests from USB 3.0 host
    CyU3PUsbRegisterLPMRequestCallback(CyFxApplnLPMRqtCB);

    // ----------------- Set USB descriptors -----------------

    // 1. SuperSpeed device descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_SS_DEVICE_DESCR, NULL, (uint8_t *)CyFxUSB30DeviceDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // 2. High-speed device descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_HS_DEVICE_DESCR, NULL, (uint8_t *)CyFxUSB20DeviceDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // BOS descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_SS_BOS_DESCR, NULL, (uint8_t *)CyFxUSBBOSDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Device qualifier descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_DEVQUAL_DESCR, NULL, (uint8_t *)CyFxUSBDeviceQualDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // SuperSpeed configuration descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_SS_CONFIG_DESCR, NULL, (uint8_t *)CyFxUSBSSConfigDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // High-speed configuration descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_HS_CONFIG_DESCR, NULL, (uint8_t *)CyFxUSBHSConfigDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint(4, "Descriptor failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Full speed configuration descriptor
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_FS_CONFIG_DESCR, NULL, (uint8_t *)CyFxUSBFSConfigDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint(4, "Descriptor failed, Error Code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // String descriptor 0
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_STRING_DESCR, 0, (uint8_t *)CyFxUSBStringLangIDDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint(4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // String descriptor 1
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_STRING_DESCR, 1, (uint8_t *)CyFxUSBManufactureDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // String descriptor 2
    apiRetStatus = CyU3PUsbSetDesc(CY_U3P_USB_SET_STRING_DESCR, 2, (uint8_t *)CyFxUSBProductDscr);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "Descriptor failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

    // Connect the USB Pins with SuperSpeed operation enabled
    apiRetStatus = CyU3PConnectState(CyTrue, CyTrue);
    if (apiRetStatus != CY_U3P_SUCCESS)
    {
        CyU3PDebugPrint (4, "USB Connect failed, Error code = %d\n", apiRetStatus);
        SlaveFifoErrorHandler(apiRetStatus);
    }

}

// Initializing the debug mechanism and main slave FIFO application
void SlaveFifoAppThread_Entry(uint32_t input) {
	SlaveFifoAppDebugInit();
	CyFxSlFifoApplnInit();
	// SlaveFifoAppStart();

    for (;;) {
        CyU3PThreadSleep(1000);
        if (glIsApplnActive) {
            // Print the number of buffers received so far from the USB host.
            CyU3PDebugPrint(6, "Data tracker: buffers received: %d, buffers sent: %d.\n", glDMARxCount, glDMATxCount);
        }
    }
}

// Application define function for creating threads
void CyFxApplicationDefine() {

    // Allocate memory for thread
    void *ptr = NULL;
    uint32_t retThrdCreate = CY_U3P_SUCCESS;

    // Allocate the memory for the thread
    ptr = CyU3PMemAlloc (CY_FX_SLFIFO_THREAD_STACK);

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

    // Check the return code
    if (retThrdCreate != 0) {

    	// Thread Creation failed with error code retThrdCreate
    	// Custom recovery or debug actions can be added below

    	// Loop indefinitely to ensure the application doesn't continue
    	while(1);
    }
}

// Main Application Program
int main() {

    CyU3PReturnStatus_t status = CY_U3P_SUCCESS;
    CyU3PIoMatrixConfig_t io_cfg;
    CyU3PSysClockConfig_t clockConfig;

    // First step in the firmware: Device initialization
    // CPU clock is set up (Passing NULL selects default clock configuration) and Vectored Interrupt Controller is configured
#if (CY_FX_SLFIFO_GPIF_16_32BIT_CONF_SELECT == 0)
    clockConfig.setSysClk400  = CyFalse;
#else
    clockConfig.setSysClk400  = CyTrue;
#endif
    clockConfig.cpuClkDiv = 2;
    clockConfig.dmaClkDiv = 2;
    clockConfig.mmioClkDiv = 2;
    clockConfig.useStandbyClk = CyFalse;
    clockConfig.clkSrc = CY_U3P_SYS_CLK;

    status = CyU3PDeviceInit (&clockConfig);
    if (status != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(status);
    }

    // Second step: Enable device caches (8kB data cache and 8kB instruction cache)
    status = CyU3PDeviceCacheControl (CyTrue, CyFalse, CyFalse);
    if (status != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(status);
    }

    // Third step: Configuration of required IO ports (In our case, SPI, UART and GPIF)
    CyU3PMemSet ((uint8_t *)&io_cfg, 0, sizeof(io_cfg));
    io_cfg.s0Mode = CY_U3P_SPORT_INACTIVE;
    io_cfg.s1Mode = CY_U3P_SPORT_INACTIVE;
    io_cfg.useI2C = CyFalse;
    io_cfg.useI2S = CyTrue;
    io_cfg.useSpi = CyTrue;
    io_cfg.useUart = CyTrue;

#if (CY_FX_SLFIFO_GPIF_16_32BIT_CONF_SELECT == 0)
    io_cfg.isDQ32Bit = CyFalse;
    io_cfg.lppMode   = CY_U3P_IO_MATRIX_LPP_SPI_ONLY;
#else
    io_cfg.isDQ32Bit = CyTrue;
    io_cfg.lppMode   = CY_U3P_IO_MATRIX_LPP_DEFAULT;
#endif

    io_cfg.gpioSimpleEn[0]  = 0;
    io_cfg.gpioSimpleEn[1]  = 0x08000000;
    io_cfg.gpioComplexEn[0] = 0;
    io_cfg.gpioComplexEn[1] = 0;

    // Initialize the IO matrix configuration data structure
    status = CyU3PDeviceConfigureIOMatrix (&io_cfg);
    if (status != CY_U3P_SUCCESS) {
        SlaveFifoErrorHandler(status);
    }

    // Initializing the RTOS via its wrapper, and starting the OS timer
    // Transfer the control to the RTOS scheduler
    CyU3PKernelEntry ();

    /*
    // Fatal error: Infinite unresponsive loop
    handle_fatal_error:
        while(1);
    */

    return 0;
}
