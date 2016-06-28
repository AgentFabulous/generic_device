#wifi items
PRODUCT_PACKAGES += \
		wifi.rc \
		libwpa_client \
		hostapd \
		wpa_supplicant \

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	device/linaro/hikey/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \

PRODUCT_PROPERTY_OVERRIDES += \
		wifi.interface=wlan0 \
		wifi.supplicant_scan_interval=15


subdirs-true :=
subdirs-$(CONFIG_QCOM_WIFI) += qcom
include $(foreach dir,$(subdirs-true), $(LOCAL_PATH)/wifi/$(dir)/device.mk)
PRODUCT_COPY_FILES += $(PRODUCT_COPY_FILES-true)
