#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common OrangeFox stuff.
$(call inherit-product, vendor/recovery/config/common.mk)

# Inherit from kona device
$(call inherit-product, device/moorechip/kona/device.mk)

# OrangeFox-specific properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.orangefox.version=R11.1 \
    ro.orangefox.build.date=$(shell date +%Y%m%d) \
    ro.orangefox.build.type=Unofficial

PRODUCT_DEVICE := kona
PRODUCT_NAME := twrp_kona
PRODUCT_BRAND := qti
PRODUCT_MODEL := Retroid Pocket 5
PRODUCT_MANUFACTURER := moorechip

PRODUCT_GMS_CLIENTID_BASE := android-moorechip

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="kona-user 11 RKQ1.230824.001 RP501212251 release-keys"

BUILD_FINGERPRINT := qti/kona/kona:11/RKQ1.230824.001/RP501212251:user/release-keys
