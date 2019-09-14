#
# Copyright (C) 2019 Andreas Nilsen <adde88@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hcxtools-custom
PKG_VERSION:=5.2.2
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/ZerBea/hcxtools.git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_VERSION:=0d97421953bf463ceb8f8d5206e3ee3cd039379a
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=license.txt

include $(INCLUDE_DIR)/package.mk

define Package/hcxtools-custom
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libpcap +zlib +libcurl +libopenssl
  TITLE:=hcxtools-custom
  URL:=https://github.com/ZerBea/hcxtools
  SUBMENU:=Wireless
endef

define Package/hcxtools-custom/description
  Set of tools convert packets from captures (h = hash, c = capture, convert and calculate candidates, x = different hashtypes)
  for the use with latest hashcat or John the Ripper.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/hcxtools-custom/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlanwkp2hcx	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlanpmk2hcx	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlanhcxmnc	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxessidtool	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlanjohn2hcx	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxpcaptool	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlanhcx2john	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxpsktool	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlancow2hcxpmk	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlanhcxinfo	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxhash2cap	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxhashcattool	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlanhashhcx	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlancap2wpasec	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlanhc2hcx	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxwltool	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/whoismac		$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlancap2wpasec	$(1)/sbin/
endef

$(eval $(call BuildPackage,hcxtools-custom))
