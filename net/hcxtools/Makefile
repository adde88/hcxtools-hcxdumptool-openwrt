#
# Copyright (C) 2009-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hcxtools
PKG_VERSION:=5.1.0
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/hcxtools-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/ZerBea/hcxtools.git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_VERSION:=e5d60eefbe3218d2705d9e094d0b781e740fadb4
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com.com>

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/hcxtools
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libpcap +zlib +libcurl +libopenssl
  TITLE:= hcxtools
  URL:=https://github.com/ZerBea/hcxtools.git
  SUBMENU:=wireless
endef

define Package/hcxtools/description
  Set of tools convert packets from captures (h = hash, c = capture, convert and calculate candidates, x = different hashtypes)
  for the use with latest hashcat or John the Ripper.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/hcxtools/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/hcxpcaptool	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/hcxhashcattool	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhcx2cap	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhc2hcx	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanwkp2hcx	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhcx2essid	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhcx2ssid	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhcxinfo	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhcxmnc	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhashhcx	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhcxcat	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanpmk2hcx	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanjohn2hcx	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlancow2hcxpmk	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhcx2john	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlanhcx2psk	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlancap2wpasec	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/whoismac		$(1)/sbin/
endef

$(eval $(call BuildPackage,hcxtools))
