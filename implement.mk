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
