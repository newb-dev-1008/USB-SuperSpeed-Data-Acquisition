/*
 ## Cypress USB 3.0 Platform header file (cyfxslfifoasync.h)
 ## ===========================
 ##
 ##  Copyright Cypress Semiconductor Corporation, 2010-2018,
 ##  All Rights Reserved
 ##  UNPUBLISHED, LICENSED SOFTWARE.
 ##
 ##  CONFIDENTIAL AND PROPRIETARY INFORMATION
 ##  WHICH IS THE PROPERTY OF CYPRESS.
 ##
 ##  Use of this file is governed
 ##  by the license agreement included in the file
 ##
 ##     <install>/license/license.txt
 ##
 ##  where <install> is the Cypress software
 ##  installation root directory path.
 ##
 ## ===========================
*/

/* This file contains the constants and definitions used by the Slave FIFO application example */

#ifndef _INCLUDED_CYFXSLFIFOASYNC_H_
#define _INCLUDED_CYFXSLFIFOASYNC_H_

#include "cyu3externcstart.h"
#include "cyu3types.h"
#include "cyu3usbconst.h"

/* 16/32 bit GPIF Configuration select */
/* Set CY_FX_SLFIFO_GPIF_16_32BIT_CONF_SELECT = 0 for 16 bit GPIF data bus.
 * Set CY_FX_SLFIFO_GPIF_16_32BIT_CONF_SELECT = 1 for 32 bit GPIF data bus.
 */
#define CY_FX_SLFIFO_GPIF_16_32BIT_CONF_SELECT (0)



#define STREAM_IN_OUT
#define LOOPBACK_SHRT_ZLP

/* set up DMA channel for loopback transfers */
/* If LOOPBACK_SHRT_ZLP is defined, the following parameters are set. */
#ifdef LOOPBACK_SHRT_ZLP
#define BURST_LEN 1
#define DMA_BUF_SIZE						  (1)
#define CY_FX_SLFIFO_DMA_BUF_COUNT_P_2_U      (2)              	/* Slave FIFO P_2_U channel buffer count - Used with AUTO DMA channel */
#define CY_FX_SLFIFO_DMA_BUF_COUNT_U_2_P 	  (2)			   	/* Slave FIFO U_2_P channel buffer count - Used with AUTO DMA channel */
#endif

/* set up DMA channel for stream IN/OUT transfers */
/* If STREAM_IN_OUT is defined, the following parameters are set. */
#ifdef STREAM_IN_OUT
#define BURST_LEN 16
#define DMA_BUF_SIZE						 (16)
#define CY_FX_SLFIFO_DMA_BUF_COUNT_P_2_U      (4)				/* Slave FIFO P_2_U channel buffer count */
#define CY_FX_SLFIFO_DMA_BUF_COUNT_U_2_P 	  (8)				/* Slave FIFO U_2_P channel buffer count */
#endif

#define CY_FX_SLFIFO_DMA_BUF_COUNT      (2)                    	/* Slave FIFO channel buffer count */
#define CY_FX_SLFIFO_DMA_TX_SIZE        (0)	                  	/* DMA transfer size is set to infinite */
#define CY_FX_SLFIFO_DMA_RX_SIZE        (0)	                  	/* DMA transfer size is set to infinite */
#define CY_FX_SLFIFO_THREAD_STACK       (0x0400)               	/* Slave FIFO application thread stack size */
#define CY_FX_SLFIFO_THREAD_PRIORITY    (8)                		/* Slave FIFO application thread priority */

/* Give a timeout value of 5s for any flash programming. */
#define CY_FX_USB_SPI_TIMEOUT                   (5000)

/* USB vendor request to read the 8 byte firmware ID. This will return content
 * of glFirmwareID array. */
#define CY_FX_RQT_ID_CHECK                      (0xB0)

/* USB vendor request to write data to SPI flash connected. The flash page size is
 * fixed to 256 bytes. The memory address to start the write is provided in the
 * index field of the request. The maximum allowed request length is 4KB. */
#define CY_FX_RQT_SPI_FLASH_WRITE               (0xC2)

/* USB vendor request to read data from SPI flash connected. The flash page size is
 * fixed to 256 bytes. The memory address to start the read is provided in the index
 * field of the request. The maximum allowed request length is 4KB. */
#define CY_FX_RQT_SPI_FLASH_READ                (0xC3)

/* USB vendor request to erase a sector on SPI flash connected. The flash sector
 * size is fixed to 64KB. The sector address is provided in the index field of
 * the request. The erase is carried out if the value field is non-zero. If this
 * is zero, then the request returns the write in progress (WIP) bit. WIP should
 * be 0 before issuing any further transactions. */
#define CY_FX_RQT_SPI_FLASH_ERASE_POLL          (0xC4)
/* Endpoint and socket definitions for the Slave FIFO application */

/* To change the Producer and Consumer EP enter the appropriate EP numbers for the #defines.
 * In the case of IN endpoints enter EP number along with the direction bit.
 * For eg. EP 6 IN endpoint is 0x86
 *     and EP 6 OUT endpoint is 0x06.
 * To change sockets mention the appropriate socket number in the #defines. */

/* Note: For USB 2.0 the endpoints and corresponding sockets are one-to-one mapped
         i.e. EP 1 is mapped to UIB socket 1 and EP 2 to socket 2 so on */

#define CY_FX_EP_PRODUCER               0x01    /* EP 1 OUT */
#define CY_FX_EP_CONSUMER               0x81    /* EP 1 IN */

#define CY_FX_PRODUCER_USB_SOCKET    CY_U3P_UIB_SOCKET_PROD_1    /* USB Socket 1 is producer */
#define CY_FX_CONSUMER_USB_SOCKET    CY_U3P_UIB_SOCKET_CONS_1    /* USB Socket 1 is consumer */


/* Used with FX3 Silicon. */
#define CY_FX_PRODUCER_PPORT_SOCKET    CY_U3P_PIB_SOCKET_0    /* P-port Socket 0 is producer */
#define CY_FX_CONSUMER_PPORT_SOCKET    CY_U3P_PIB_SOCKET_3    /* P-port Socket 3 is consumer */

/* Extern definitions for the USB Descriptors */
extern const uint8_t CyFxUSB20DeviceDscr[];
extern const uint8_t CyFxUSB30DeviceDscr[];
extern const uint8_t CyFxUSBDeviceQualDscr[];
extern const uint8_t CyFxUSBFSConfigDscr[];
extern const uint8_t CyFxUSBHSConfigDscr[];
extern const uint8_t CyFxUSBBOSDscr[];
extern const uint8_t CyFxUSBSSConfigDscr[];
extern const uint8_t CyFxUSBStringLangIDDscr[];
extern const uint8_t CyFxUSBManufactureDscr[];
extern const uint8_t CyFxUSBProductDscr[];

#include "cyu3externcend.h"

#endif /* _INCLUDED_CYFXSLFIFOASYNC_H_ */

/*[]*/
