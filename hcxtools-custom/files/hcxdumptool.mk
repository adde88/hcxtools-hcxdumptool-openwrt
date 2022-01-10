#
# Copyright (C) 2021 Andreas Nilsen <adde88@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

BUILD_DIR3="$(PKG_BUILD_DIR)/src-hcxdumptool-custom"

define Package/hcxdumptool-custom
$(call Package/hcxtools-custom/Default)
  TITLE:=hcxdumptool-custom
  URL:=https://github.com/ZerBea/hcxdumptool
endef

define Package/hcxdumptool-custom/description
  Small tool to capture packets from wlan devices. After capturing, upload
  the "uncleaned" cap here (https://wpa-sec.stanev.org/?submit)
  to see if your ap or the client is vulnerable by using common wordlists.
  Convert the cap to hccapx and/or to WPA-PMKID-PBKDF2 hashline (16800) with hcxpcaptool (hcxtools)
  and check if wlan-key or plainmasterkey was transmitted unencrypted.
endef

define Package/hcxdumptool-custom/install
	$(INSTALL_DIR)  $(1)/sbin
	$(INSTALL_BIN)  $(BUILD_DIR3)/hcxdumptool $(1)/sbin/
endef
