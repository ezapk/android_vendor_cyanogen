# Inherit AOSP device configuration for Ascend.
$(call inherit-product, device/huawei/ascend2/ascend2.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

PRODUCT_NAME := cyanogen_ascend2
PRODUCT_BRAND := Huawei
PRODUCT_DEVICE := ascend2
PRODUCT_MODEL := M865
PRODUCT_MANUFACTURER := Huawei
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_DEVICE=hwm865 PRODUCT_NAME=M865 BUILD_ID=GINGERBREAD BUILD_DISPLAY_ID=$(shell date +%m%d%Y) BUILD_FINGERPRINT=Huawei/M865/hwm865:2.3.5/HuaweiM865/C153B826:user/ota-rel-keys,release-keys

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-ascend2.map

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CM7.2-M865-Nightly$(shell date +%m%d%Y)
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CM-7.2RC-M865
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CM7.2-M865-$(shell date +%m%d%Y)
    endif
endif

#
# Copy legend specific prebuilt files
#
# Lights and graphics
PRODUCT_COPY_FILES += \
   vendor/huawei/ascend2/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so

PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so

# Proprietary RIL related
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/lib/libril.so:system/lib/libril.so
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/lib/libwpa_client.so:system/lib/libwpa_client.so

