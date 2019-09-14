#
# Copyright (C) 2019 Andreas Nilsen <adde88@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hcxdumptool-custom
PKG_VERSION:=5.2.2
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/ZerBea/hcxdumptool.git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_VERSION:=5a375ac995240b42ddaa64066b077a311acc8a25
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=license.txt

include $(INCLUDE_DIR)/package.mk

define Package/hcxdumptool-custom
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=hcxdumptool-custom
  URL:=https://github.com/ZerBea/hcxdumptool
  SUBMENU:=Wireless
endef

define Package/hcxdumptool-custom/description
  Small tool to capture packets from wlan devices. After capturing, upload
  the "uncleaned" cap here (https://wpa-sec.stanev.org/?submit)
  to see if your ap or the client is vulnerable by using common wordlists.
  Convert the cap to hccapx and/or to WPA-PMKID-PBKDF2 hashline (16800) with hcxpcaptool (hcxtools)
  and check if wlan-key or plainmasterkey was transmitted unencrypted.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/hcxdumptool-custom/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxdumptool $(1)/sbin/
endef

$(eval $(call BuildPackage,hcxdumptool-custom))
