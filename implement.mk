#
# Copyright (C) 2025 The NeoGSI Project
#
# SPDX-License-Identifier: Apache-2.0
#

# All unconditial prop changes
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.neogsi.is_ngsi=true \
    ro.adb.secure=1 \
    persist.sys.strictmode.disable=true \
    ro.ota.allow_downgrade=true

# Disable unnecessary (and sometimes problematic) debugging and restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Install NeoGSI post-fs-data hook
PRODUCT_COPY_FILES += \
    vendor/ngsi/ngsi.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/ngsi.rc

# SELinux schenanigans
SELINUX_IGNORE_NEVERALLOWS := true

# Install the NeoGSI version of the resetprop
PRODUCT_PACKAGES += \
    resetprop_ngsi

# Install 0000deviceinfo.payload
PRODUCT_COPY_FILES += \
    vendor/ngsi/payloads/0000deviceinfo.payload/metadata.prop:$(TARGET_COPY_OUT_SYSTEM)/ngsi/payloads/0000deviceinfo.payload/metadata.prop \
    vendor/ngsi/payloads/0000deviceinfo.payload/checkup.sh:$(TARGET_COPY_OUT_SYSTEM)/ngsi/payloads/0000deviceinfo.payload/checkup.sh \
    vendor/ngsi/payloads/0000deviceinfo.payload/run-on-apply.sh:$(TARGET_COPY_OUT_SYSTEM)/ngsi/payloads/0000deviceinfo.payload/run-on-apply.sh
