################################################################################
#                            DO NOT EDIT THIS FILE!                            #
#           Copy project.mk.template to project.mk and use project.mk.         #
################################################################################
# Copyright 2016, Pablo Ridolfi
# Copyright 2017, Eric Pernia
# All rights reserved.
#
# This file is part of Workspace.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from this
#    software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

#-------------------------------------------------------------------------------
# current project
#-------------------------------------------------------------------------------

# examples

#PROJECT = examples/blinky
#PROJECT = examples/blinky_rit
#PROJECT = examples/adc_fir_dac
#PROJECT = examples/freertos_blinky
#PROJECT = sapi_examples/edu-ciaa-nxp/sapi_usb_host_01_mass_storage_fatfilesystem
#PROJECT = examples/td3_freertos_01
#PROJECT = examples/td3_freertos_02
#PROJECT = examples/td3_freertos_03
PROJECT = examples/td3_freertos_04

# sapi_examples

#PROJECT = sapi_examples/edu-ciaa-nxp/gpio_01_switches_leds
#PROJECT = sapi_examples/edu-ciaa-nxp/gpio_02_blinky
#PROJECT = sapi_examples/edu-ciaa-nxp/gpio_03_blinky_switch
#PROJECT = sapi_examples/edu-ciaa-nxp/gpio_04_led_sequences
#PROJECT = sapi_examples/edu-ciaa-nxp/gpio_05_keypad_7segment

#PROJECT = sapi_examples/edu-ciaa-nxp/uart_01_echo
#PROJECT = sapi_examples/edu-ciaa-nxp/uart_02_receive_string_blocking
#PROJECT = sapi_examples/edu-ciaa-nxp/uart_03_receive_string
#PROJECT = sapi_examples/edu-ciaa-nxp/uart_04_bridge_esp8266

#PROJECT = sapi_examples/edu-ciaa-nxp/adc_dac_01

#PROJECT = sapi_examples/edu-ciaa-nxp/tick_01_tickHook
#PROJECT = sapi_examples/edu-ciaa-nxp/rtc_01

#PROJECT = sapi_examples/edu-ciaa-nxp/pwm_01
#PROJECT = sapi_examples/edu-ciaa-nxp/servo_01

#PROJECT = sapi_examples/edu-ciaa-nxp/i2c_01_hmc5883l

#PROJECT = sapi_examples/edu-ciaa-nxp/spi_01_sdcard_fatfilesystem

#PROJECT = sapi_examples/edu-ciaa-nxp/cooperative_os_scheduler_01_seos
#PROJECT = sapi_examples/edu-ciaa-nxp/cooperative_os_scheduler_02_seos_background_foreground
#PROJECT = sapi_examples/edu-ciaa-nxp/cooperative_os_scheduler_03_seos_Pont2014

#PROJECT = sapi_examples/edu-ciaa-nxp/freeOSEK_01_blinky

#PROJECT = sapi_examples/edu-ciaa-nxp/freeRTOS_01_blinky
#PROJECT = sapi_examples/edu-ciaa-nxp/freeRTOS_02_ChanFatFS_SPI_SdCard_ADC_log
#PROJECT = sapi_examples/edu-ciaa-nxp/freeRTOS_03_Queue

#-------------------------------------------------------------------------------
# current target
#-------------------------------------------------------------------------------

TARGET = lpc4337_m4
#TARGET = lpc4337_m0
#TARGET = lpc1769
#TARGET = lpc54102_m4
#TARGET = lpc54102_m0
#TARGET = lpc11u68

#-------------------------------------------------------------------------------
# current board (optional)
#-------------------------------------------------------------------------------

BOARD = edu_ciaa_nxp
#BOARD = ciaa_nxp
#BOARD = lpcxpresso1769

#-------------------------------------------------------------------------------

# Object file for multicore applications (only needed by lpc54102_m4 target if
# you need to add an lpc54102_m0 program). For example:
#SLAVE_OBJ_FILE = out/lpc54102_m0/blinky_m0.axf.o

#-------------------------------------------------------------------------------
