#!/bin/bash
#
# Installation script for hcxdumptool and hcxtools, for the Pineapple NANO and TETRA.
# Written by: Andreas Nilsen - adde88@gmail.com - https://www.github.com/adde88
#
#

display_help() {
  echo "Usage: `basename $0` [option...]" >&2
  echo
  echo "   -c, --custom              Install custom version "
  echo
  echo
  echo "Install script made by Andreas Nilsen @adde88"
  exit 1
}

original(){
  echo -e "Installing: hcxdumptool and hcxtools, original version from openwrt repos."
  opkg update
  if [ -e /sd ]; then
          # Nano install (Let's use the SD-card, if it exists)
          opkg --dest sd install hcxdumptool hcxtools --force-overwrite
  else
          # Tetra install / general install.
          opkg install hcxdumptool hcxtools --force-overwrite
  fi
  echo -e "Finished installing hcxdumptool and hcxtools (original versions)."
  echo -e "-@adde88"
  exit 0
}

bleeding_edge() {
  # Let's always get the latest versions
  mkdir -p /tmp/HcxTools
  wget https://github.com/adde88/hcxtools-hcxdumptool-openwrt/tree/openwrt-19.07/bin/packages/mips_24kc/custom -P /tmp/HcxTools 2&>1 >/dev/null
  HCXDUMPTOOL=`grep -F "hcxdumptool-custom_" /tmp/HcxTools/custom | awk {'print $8'} | awk -F'"' {'print $2'} | grep "mips_24kc" `
  HCXTOOLS=`grep -F "hcxtools-custom_" /tmp/HcxTools/custom | awk {'print $8'} | awk -F'"' {'print $2'} | grep "mips_24kc"`
  #
  # Tell the user what's going on...
  echo -e "Installing: hcxdumptool and hcxtools, custom bleeding-edge versions from @adde88"
  #
  # Download latest IPK's to temp directory, and then update OPKG repositories.
  cd /tmp
  opkg update
  wget "https://github.com/adde88/hcxtools-hcxdumptool-openwrt/raw/openwrt-19.07/bin/packages/mips_24kc/custom/"$HCXTOOLS"" 2&>1 >/dev/null
  wget "https://github.com/adde88/hcxtools-hcxdumptool-openwrt/raw/openwrt-19.07/bin/packages/mips_24kc/custom/"$HCXDUMPTOOL"" 2&>1 >/dev/null
  #
  # Install procedure
  if [ -e /sd ]; then
	# Nano install (Let's use the SD-card, if it exists)
	opkg --dest sd install "$HCXTOOLS" "$HCXDUMPTOOL" --force-overwrite
  else
	# Tetra install / general install.
	opkg install "$HCXTOOLS" "$HCXDUMPTOOL" --force-overwrite
  fi
  #
  # Cleanup
  rm -rf "$HCXTOOLS" "$HCXDUMPTOOL" /tmp/HcxTools/
  echo -e "Finished installing hcxdumptool and hcxtools (custom bleeding-edge versions)."
  echo -e "-@adde88"
  exit 0
}

for arg in "$@"
do
    if [ "$arg" == "-h" ] || [ "$arg" == "--help" ]; then
        display_help
    elif [ "$arg" == "-c" ] || [ "$arg" == "--custom" ]; then
        bleeding_edge
    fi
done

original
