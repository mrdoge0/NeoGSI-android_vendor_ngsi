#!/system/bin/sh
# NeoGSI Device Info Payload - A more basic version of Fix_GSI_Identity_Crisis
# (c) 2025 mrdoge0, Free Software Licensed under Apache-2.0

# 99,999999999% of "vendor" filesystems come from stock ROMs or conventional custom ROMs, so they have the correct device info.
VENDORPROP="/vendor/build.prop"
SYSTEMPROP="/system/build.prop"

if [ -f "${VENDORPROP}" ]; then
    ## Main function
    
    # Get source props.
    VENDORBRAND=$(grep -E 'ro.product.vendor.brand=' "${VENDORPROP}" | cut -d'=' -f2)
    VENDORDEVICE=$(grep -E 'ro.product.vendor.device=' "${VENDORPROP}" | cut -d'=' -f2)
    VENDORMANUFACTURER=$(grep -E 'ro.product.vendor.manufacturer=' "${VENDORPROP}" | cut -d'=' -f2)
    VENDORMODEL=$(grep -E 'ro.product.vendor.model=' "${VENDORPROP}" | cut -d'=' -f2)

    # Do the props.
    if [ ! -z "${VENDORDEVICE}" ]; then
        for PART in "" ".product" ".system" ".system_ext" ".bootimage"; do
            resetprop -n ro.product${PART}.brand "${VENDORBRAND}"
            resetprop -n ro.product${PART}.device "${VENDORDEVICE}"
            resetprop -n ro.product${PART}.manufacturer "${VENDORMANUFACTURER}"
            resetprop -n ro.product${PART}.model "${VENDORMODEL}"
        done
    else
        log -p e -t NeoGSI "0000deviceinfo.payload: Operation FAILED"
        exit 1
    fi

    # Market name support - Separate from standard resetprops because some devices don't have marketname props.
    ODMMN=$(grep -E 'ro.product.odm.marketname=' "/odm/etc/build.prop" | cut -d'=' -f2)
    if [ ! -z ${ODMMN} ]; then
        for PART in "" ".product" ".system" ".system_ext" ".bootimage"; do
            resetprop -n ro.product${PART}.marketname "${ODMMN}"
        done
        for PART in "system_dlkm" "bootimage"; do
            resetprop -n ro.product.${PART}.marketname "${VENDORDEVICE}"
        done
    fi

    # Report your success.
    log -p i -t NeoGSI "0000deviceinfo.payload: Operation SUCCESSFUL"
    exit 0
else
    log -p e -t NeoGSI "0000deviceinfo.payload: Operation FAILED"
    exit 1
fi
