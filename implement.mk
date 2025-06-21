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
    vendor/ngsi/ngsi.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/ngsi.rc \
    vendor/ngsi/ngsi-post-fs-data.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/ngsi-post-fs-data.sh

# Do some workarounds for Pie / Quince Tart devices that will fix potential bootloops
PRODUCT_EXTRA_VNDK_VERSIONS += 28 29

# SELinux schenanigans
SELINUX_IGNORE_NEVERALLOWS := true

# Install the NeoGSI version of the resetprop
PRODUCT_PACKAGES += \
    resetprop_ngsi
