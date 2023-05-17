#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Lineage stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/banana/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/google/pantah/aosp_cheetah.mk)
$(call inherit-product, device/google/gs201/banana_common.mk)

include device/google/pantah/cheetah/device-banana.mk

# Parts
$(call inherit-product-if-exists, vendor/google/pixelparts/powershare/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7 Pro
PRODUCT_NAME := banana_cheetah

# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=cheetah \
    PRIVATE_BUILD_DESC="cheetah-user 13 TQ3A.230705.001 10216780 release-keys"

BUILD_FINGERPRINT := google/cheetah/cheetah:13/TQ3A.230705.001/10216780:user/release-keys
