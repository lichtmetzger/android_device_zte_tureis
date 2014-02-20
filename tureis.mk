$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/tureis/tureis-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/tureis/overlay

PRODUCT_AAPT_CONFIG := ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

# Graphics
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    hwcomposer.msm7x27 \
    copybit.msm7x27

# Lights
PRODUCT_PACKAGES += \
    lights.tureis

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.tureis \
    audio_policy.tureis

# FM Radio
PRODUCT_PACKAGES += \
    libfmradio.si4708

# Power HAL
PRODUCT_PACKAGES += \
    power.msm7x27

# Sensors
PRODUCT_PACKAGES += \
    sensors.tureis

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27

# File Manager
PRODUCT_PACKAGES += \
    GhostCommander

#Music App
PRODUCT_PACKAGES += \
    Music

#Camera
PRODUCT_PACKAGES += \
    QuickSnap

# GPS
PRODUCT_PACKAGES += \
    gps.tureis \
    librpc

# Screen is too small for ads
PRODUCT_PACKAGES += \
    AdAway

# Video
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw

# Launcher2 Port
PRODUCT_PACKAGES += \
    Launcher2

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/tureis/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/tureis/prebuilt/system,system)

# Bluetooth configuration files
#PRODUCT_COPY_FILES += \
#        device/zte/tureis/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Hardware features available on this device
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
        ro.cwm.enable_key_repeat=true

# Tureis can't handle this much shit
#$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-dalvik-heap.mk)
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_tureis
PRODUCT_DEVICE := tureis
PRODUCT_MANUFACTURER := ZTE
PRODUCT_MODEL := Tureis
