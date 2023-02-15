PIXEL_DEVICE := true

# artifacts
$(call inherit-product, device/google/pantah/artifacts.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/pantah/overlay-spark
PRODUCT_PACKAGES += \
    NowPlayingOverlay

# ADB
PRODUCT_PRODUCT_PROPERTIES += \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,adb \
    persist.service.debuggable=1 \
    persist.service.adb.enable=1

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true

# sepolicy that are required with kirisakura kernel's custom powerhint module
BOARD_SEPOLICY_DIRS += device/google/pantah/sepolicy/kirisakura

# Policy for Spark's Smart Charging impl
BOARD_SEPOLICY_DIRS += device/google/pantah/sepolicy/vendor

# properties - product
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
    ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# properties - system
PRODUCT_SYSTEM_PROPERTIES += \
    ro.spark.maintainer=Albinoman887 \
    ro.spark.maintainer.username=Albinoman887
    
# Quick Tap
TARGET_SUPPORTS_QUICK_TAP := true
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.columbus.use_ap_sensor=false

# UDFPS
TARGET_HAS_UDFPS := true
EXTRA_UDFPS_ANIMATIONS := true

# Disable PE faceunlock in favor of AOSP impl
TARGET_FACE_UNLOCK_SUPPORTED := false
