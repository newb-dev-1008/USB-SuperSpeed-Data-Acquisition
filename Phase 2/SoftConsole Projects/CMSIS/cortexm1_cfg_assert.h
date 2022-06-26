/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 *
 * Assertion implementation.
 *
 * This file provides the implementation of the ASSERT macro. This file can be
 * modified to cater for project specific requirements regarding the way
 * assertions are handled.
 *
 * SVN $Revision: 12773 $
 * SVN $Date: 2020-05-29 18:01:41 +0530 (Fri, 29 May 2020) $
 */
#ifndef __MSS_ASSERT_H_
#define __MSS_ASSERT_H_
#ifdef __cplusplus
extern "C" {
#endif

#if defined(NDEBUG)

#define ASSERT(CHECK)

#else   /* NDEBUG */

#include <assert.h>

#if defined ( __GNUC__   )

/*
 * SoftConsole assertion handling
 */
#define ASSERT(CHECK)  \
    do { \
        if (!(CHECK)) \
        { \
            __asm volatile ("BKPT\n\t"); \
        } \
    } while (0);


#elif defined ( __ICCARM__ )
/*
 * IAR Embedded Workbench assertion handling.
 * Call C library assert function which should result in error message
 * displayed in debugger.
 */
#define ASSERT(X)   assert(X)

#else
/*
 * Keil assertion handling.
 * Call C library assert function which should result in error message
 * displayed in debugger.
 */

#ifndef __MICROLIB
  #define ASSERT(X)   assert(X)
#else
  #define ASSERT(X)
#endif

#endif  /* Tool Chain */

#endif  /* NDEBUG */
#ifdef __cplusplus
}
#endif

#endif  /* __MSS_ASSERT_H_ */
