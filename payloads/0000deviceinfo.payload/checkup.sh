#!/system/bin/sh

# Fix_GSI_Identity_Crisis is one of my modules, 
# and it conflicts with this payload.
# (This payload is a basic version of that module)
if [ -d "/data/adb/modules/fix_gsi_identity_crisis" ]; then
  exit 1
else
  exit 0
fi
