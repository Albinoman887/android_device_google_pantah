#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
DEVICE_PATH := device/google/pantah/cheetah

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_cheetah

include device/google/pantah/BoardConfigLineage.mk

include vendor/google/cheetah/BoardConfigVendor.mk
