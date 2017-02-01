#
# Copyright (C) 2016 The Android Open Source Project
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
# This file is included by other product makefiles to add all the
# emulator-related modules to PRODUCT_PACKAGES.
#

# Host modules
PRODUCT_PACKAGES += \


# Device modules
PRODUCT_PACKAGES += \
    egl.cfg \
    gralloc.goldfish \
    gralloc.ranchu \
    libGLESv1_CM_emulation \
    lib_renderControl_enc \
    libEGL_emulation \
    libGLES_android \
    libGLESv2_enc \
    libOpenglSystemCommon \
    libGLESv2_emulation \
    libGLESv1_enc \
    qemu-props \
    qemud \
    camera.goldfish.jpeg \
    camera.ranchu.jpeg \
    lights.goldfish \
    gps.goldfish \
    gps.ranchu \
    sensors.goldfish \
    sensors.ranchu \
    power.goldfish \
    audio.primary.goldfish

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

ifeq ($(ENABLE_TREBLE), true)
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service
endif

PRODUCT_COPY_FILES += \
    device/generic/goldfish/fstab.goldfish:root/fstab.goldfish \
    device/generic/goldfish/init.goldfish.rc:root/init.goldfish.rc \
    device/generic/goldfish/init.goldfish.sh:system/etc/init.goldfish.sh \
    device/generic/goldfish/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    device/generic/goldfish/init.ranchu.rc:root/init.ranchu.rc \
    device/generic/goldfish/fstab.ranchu:root/fstab.ranchu \
    device/generic/goldfish/ueventd.ranchu.rc:root/ueventd.ranchu.rc \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_PACKAGE_OVERLAYS := device/generic/goldfish/overlay

PRODUCT_CHARACTERISTICS := emulator