# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

# Inherit some common CrDroid stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/pantah/aosp_cheetah.mk)
$(call inherit-product, device/google/pantah/device-lineage.mk)

# Parts
$(call inherit-product-if-exists, vendor/google/pixelparts/pixelparts.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_cheetah
PRODUCT_MODEL := Pixel 7 Pro
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=cheetah \
    PRIVATE_BUILD_DESC="cheetah-user 13 TD1A.221105.002 9104446 release-keys"

BUILD_FINGERPRINT := $(PRODUCT_OVERRIDE_FINGEPRINT)
