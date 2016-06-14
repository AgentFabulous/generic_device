#
# Copyright (C) 2014 The Android Open-Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_NAME := $(TARGET_PRODUCT)
PRODUCT_DEVICE := $(TARGET_PRODUCT)
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    libGLES_mesa \
    libGLES_android \
    hwcomposer.drm \
    gralloc.drm

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
			system/core/rootdir/init.rc:root/init.rc \
			$(LOCAL_PATH)/init.rc:root/init.unknown.rc \
			$(LOCAL_PATH)/ueventd.rc:root/ueventd.unknown.rc \
			$(LOCAL_PATH)/fstab:root/fstab.unknown)

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
	$(LOCAL_PATH)/a300_pfp.fw:root/lib/firmware/a300_pfp.fw \
	$(LOCAL_PATH)/a300_pm4.fw:root/lib/firmware/a300_pm4.fw \
)

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
	frameworks/native/data/etc/android.hardware.screen.portrait.xml:system/etc/permissions/android.hardware.screen.portrait.xml

subdirs-true :=
$(info Including device subdirs: $(subdirs-true))

include $(foreach dir,$(subdirs-true), $(LOCAL_PATH)/$(dir)/device.mk)
DEVICE_PACKAGE_OVERLAYS += $(foreach dir,$(subdirs-true), $(LOCAL_PATH)/$(dir)/overlay)
