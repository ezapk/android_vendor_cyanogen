# Inherit AOSP device configuration for M835.
$(call inherit-product, device/huawei/m835/m835.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_m835
PRODUCT_BRAND := Huawei
PRODUCT_DEVICE := m835
PRODUCT_MODEL := HUAWEI-M835
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=M835 BUILD_ID=GRJ90 BUILD_DISPLAY_ID=GRJ90-$(shell date +%m%d%Y) BUILD_FINGERPRINT=google/soju/crespo:2.3.5/GRJ90/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.5 GRJ90 121341 release-keys" BUILD_NUMBER=121341 PRODUCT_DEVICE=hwm835 

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=../../../../device/huawei/M835/include/prelink-linux-arm-M835.map

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CM7.2-M835-Nightly$(shell date +%m%d%Y)
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CM-7.2RC-M835
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CM7.2-M835-$(shell date +%m%d%Y)
    endif
endif
