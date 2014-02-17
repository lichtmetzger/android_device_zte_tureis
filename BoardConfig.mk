#
# Copyright (C) 2011 The Android Open-Source Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/zte/tureis/BoardConfigVendor.mk

# CPU
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi
TARGET_CPU_ABI2 := armeabi-v6l
TARGET_ARCH_VARIANT := armv6-vfp

# Target and board properties
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_PROVIDES_LIBRIL := true
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOOTLOADER_BOARD_NAME := tureis
TARGET_SPECIFIC_HEADER_PATH := device/zte/tureis/include
# TARGET_USES_2G_VM_SPLIT := true
DEVICE_RESOLUTION := 320x240
BOARD_LDPI_RECOVERY := true

# Recovery
TARGET_RECOVERY_INITRC := device/zte/tureis/recovery/recovery.rc
TARGET_RECOVERY_FSTAB := device/zte/tureis/recovery/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/zte/tureis/recovery/recovery_keys.c
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/tureis/recovery/recovery_kernel

# Kernel
TARGET_KERNEL_SOURCE := kernel/zte/zte-kernel-msm7x27
TARGET_KERNEL_CONFIG := cyanogen_tureis_defconfig
BOARD_KERNEL_BASE := 0x02600000
# For debugging via framebuffer, uncomment this. Remember to activate framebuffer in defconfig:
#BOARD_KERNEL_CMDLINE := androidboot.hardware=tureis console=tty0 no_console_suspend=1
BOARD_KERNEL_CMDLINE := androidboot.hardware=tureis console=null

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/fw_4329.bin"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/fw_4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/fw_4329.bin nvram_path=/system/etc/nv_4329.txt"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_LOADER_REUSE := true
WIFI_BAND := 802_11_ABG

# Bluetooth
# It only activates one time, because the stupid bluedroid logic tries to patch /dev/ttyHS0 every time we activate it, which only
# works one time and destroys the interface. For Bluetooth to work, comment the activation check in btif_core. Not ideal but working for now.
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/zte/tureis/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/tureis/bluetooth

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# QCOM
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_LEGACY_OMX

# Graphics
BOARD_EGL_CFG := device/zte/tureis/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT -DQCOM_NO_SECURE_PLAYBACK

# Bootanimation
TARGET_BOOTANIMATION_USE_RGB565 := true

# Fonts
SMALLER_FONT_FOOTPRINT := true

# Camera
TARGET_DISABLE_ARM_PIE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

# Dalvik
TARGET_ARCH_LOWMEM := true

# FM Radio
# The radio works but there is no application to work on 320x240. Including it anyway.
BOARD_USES_STE_FMRADIO := true
BOARD_HAVE_QCOM_FM := true
COMMON_GLOBAL_CFLAGS += -DSTE_FM -DQCOM_FM_ENABLED

BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 230686720
BOARD_USERDATAIMAGE_PARTITION_SIZE := 170393600
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_DATA_DEVICE := /dev/block/mtdblock6
BOARD_DATA_FILESYSTEM := yaffs2
BOARD_DATA_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mtdblock5
BOARD_SYSTEM_FILESYSTEM := yaffs2
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_CACHE_DEVICE := /dev/block/mtdblock4
BOARD_CACHE_FILESYSTEM := yaffs2
BOARD_CACHE_FILESYSTEM_OPTIONS := rw

#dev:    size   erasesize  name
#mtd0: 00600000 00020000 "recovery"
#mtd1: 00400000 00020000 "boot"
#mtd2: 00180000 00020000 "splash"
#mtd3: 00080000 00020000 "misc"
#mtd4: 03980000 00020000 "cache"
#mtd5: 0dc00000 00020000 "system"
#mtd6: 0a280000 00020000 "userdata"
#mtd7: 00100000 00020000 "oem"
#mtd8: 00180000 00020000 "persist"

