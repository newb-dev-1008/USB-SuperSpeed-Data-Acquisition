/*
 * main.c
 *
 *  Created on: May 7, 2022
 *      Author: Yash Umale
 */

#include "hw_platform.h"
#include "./drivers/CoreGPIO/core_gpio.h"
#include "./drivers/CoreUARTapb/core_uart_apb.h"

#include "./CMSIS/cortexm1_cfg.h"
#include "./CMSIS/system_cortexm1_cfg.h"

/*
 * CoreGPIO instance data.
 */
gpio_instance_t g_gpio;
UART_instance_t g_uart;

#define COREGPIO_BASE_ADDR 0x00040000UL
#define UART_BASE_ADDRESS 0x41000UL
#define BAUD_VALUE 115200

static void delay(void)
{
    volatile uint32_t delay_count = SystemCoreClock / 128u;

    while(delay_count > 0u)
    {
        --delay_count;
    }
}


/*-------------------------------------------------------------------------*//**
 * main() function.
 */
int main()
{
    /*
    * CMSIS function- sets firmware system clock to Libero definition
    */
    SystemCoreClockUpdate();

    /**************************************************************************
     * Initialize the CoreGPIO driver with the base address of the CoreGPIO
     * instance to use and the initial state of the outputs.
     *************************************************************************/
     GPIO_init( &g_gpio, COREGPIO_BASE_ADDR, GPIO_APB_32_BITS_BUS );
     UART_init(&g_uart, UART_BASE_ADDRESS, BAUD_VALUE, (DATA_8_BITS | EVEN_PARITY));

#if 0
     /*
      * Configure GPIOs if CoreGPIO not using fixed config in Libero
      */
     GPIO_config( &g_gpio, GPIO_0, GPIO_OUTPUT_MODE );
     GPIO_config( &g_gpio, GPIO_1, GPIO_OUTPUT_MODE );
     GPIO_config( &g_gpio, GPIO_2, GPIO_OUTPUT_MODE );
     GPIO_config( &g_gpio, GPIO_3, GPIO_OUTPUT_MODE );
#endif

    /*
     * Infinite loop.
     */
     for(;;)
     {
         uint32_t gpio_pattern;
         /*
          * Decrement delay counter.
          */
         delay();

         /*
          * Toggle GPIO outputs
          */
         gpio_pattern = GPIO_get_outputs( &g_gpio );
         gpio_pattern ^= 0xf;
         GPIO_set_outputs( &g_gpio, gpio_pattern );

         printf("Hello World.\n");
     }

     return 0;
}
