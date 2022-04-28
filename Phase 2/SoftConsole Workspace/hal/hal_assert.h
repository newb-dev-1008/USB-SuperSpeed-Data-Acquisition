/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 * 
 * SVN $Revision: 12829 $
 * SVN $Date: 2020-07-28 17:22:47 +0530 (Tue, 28 Jul 2020) $
 */
#ifndef HAL_ASSERT_HEADER
#define HAL_ASSERT_HEADER

#ifdef MSCC_NO_RELATIVE_PATHS
#include "cortexm1_assert.h"
#else
#include "../CMSIS/cortexm1_cfg_assert.h"
#endif

#if defined(NDEBUG)
/***************************************************************************//**
 * HAL_ASSERT() is defined out when the NDEBUG symbol is used.
 ******************************************************************************/
#define HAL_ASSERT(CHECK)

#else
/***************************************************************************//**
 * Default behavior for HAL_ASSERT() macro:
 *------------------------------------------------------------------------------
 * Using the HAL_ASSERT() macro is the same as directly using the SmartFusion2
 * CMSIS ASSERT() macro. The behavior is toolchain specific and project
 * setting specific.
 ******************************************************************************/
#define HAL_ASSERT(CHECK)     ASSERT(CHECK);

#endif  /* NDEBUG */

#endif  /* HAL_ASSERT_HEADER */
