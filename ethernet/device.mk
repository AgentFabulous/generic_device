PRODUCT_PACKAGES += ethernet.rc

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
        $(LOCAL_PATH)/ethernet/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
