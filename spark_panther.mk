#
# Copyright (C) 2022 The SparkOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Spark stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/spark/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/pantah/aosp_panther.mk)
$(call inherit-product, device/google/gs201/spark_common.mk)

include device/google/pantah/panther/device-spark.mk

# Parts
$(call inherit-product-if-exists, vendor/google/pixelparts/pixelparts.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7
PRODUCT_NAME := spark_panther

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=panther \
    PRIVATE_BUILD_DESC="panther-user 13 TQ2A.230505.002 9891397 release-keys"

BUILD_FINGERPRINT := google/panther/panther:13/TQ2A.230505.002/9891397:user/release-keys
