#!/bin/bash
#
# Installation script for hcxdumptool and hcxtools, for the Pineapple NANO and TETRA.
# Written by: Andreas Nilsen - adde88@gmail.com - https://www.github.com/adde88
#
# Starting Install.
#
#
# Let's always get the latest version
mkdir -p /tmp/HcxTools
wget https://github.com/adde88/hcxtools-hcxdumptool-openwrt/tree/master/bin/ar71xx/packages/base -P /tmp/HcxTools
HCXDUMPTOOL=`grep -F "hcxdumptool_" /tmp/HcxTools/base | awk {'print $5'} | awk -F'"' {'print $2'} | grep "ar71xx" `
HCXTOOLS=`grep -F "hcxtools_" /tmp/HcxTools/base | awk {'print $5'} | awk -F'"' {'print $2'} | grep "ar71xx"`
#
# Tell the user what's going on...
echo -e "Installing: hcxdumptool  and hcxtools."
echo -e "Go grab a cup of coffee, this will take a while...\n"
#
# Download latest IPK's to temp directory, and then update OPKG repositories.
cd /tmp
opkg update
wget "https://github.com/adde88/hcxtools-hcxdumptool-openwrt/raw/master/bin/ar71xx/packages/base/"$HCXTOOLS""
wget "https://github.com/adde88/hcxtools-hcxdumptool-openwrt/raw/master/bin/ar71xx/packages/base/"$HCXDUMPTOOL""
#
# Install procedure
if [ -e /sd ]; then
	# Nano install (Let's use the SD-card, if it exists)
	opkg --dest sd install "$HCXTOOLS" "$HCXDUMPTOOL"
else
	# Tetra install / general install.
	opkg install "$HCXTOOLS" "$HCXDUMPTOOL"
fi
#
# Cleanup
rm -rf "$HCXTOOLS" "$HCXDUMPTOOL" /tmp/HcxTools/
echo -e "Installation completed!"
exit 0
