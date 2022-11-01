#
# Copyright (C) 2020 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Kernel
TARGET_KERNEL_DTBO_PREFIX := dts/
TARGET_KERNEL_DTBO := google/dtbo.img
TARGET_KERNEL_DTB := \
    google/gs201-a0.dtb \
    google/gs201-b0.dtb

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/pantah/vendor_dlkm.modules.load))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/pantah/vendor_boot.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

TARGET_KERNEL_EXT_MODULE_ROOT := kernel/google/pantah/private/google-modules
TARGET_KERNEL_EXT_MODULES := \
    amplifiers/audiometrics \
    amplifiers/cs35l41 \
    amplifiers/cs35l45 \
    amplifiers/cs40l26 \
    amplifiers/drv2624 \
    aoc \
    aoc/alsa \
    aoc/usb \
    bluetooth/broadcom \
    bms \
    display/samsung \
    edgetpu/janeiro/drivers/edgetpu \
    gpu/mali_kbase \
    gpu/mali_pixel \
    gxp/gs201 \
    lwis \
    nfc \
    power/reset \
    touch/common \
    touch/focaltech/ft3658 \
    touch/sec \
    touch/synaptics \
    uwb/kernel \
    wlan/bcmdhd4389 \
    video/gchips

