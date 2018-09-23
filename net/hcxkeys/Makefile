#
# Copyright (C) 2009-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hcxkeys
PKG_VERSION:=4.0.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/hcxkeys-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/ZerBea/hcxkeys.git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_VERSION:=451c639d5fc099acb3eb86f647450650452cba2e
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com.com>

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/hcxkeys
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +librt +libopenssl
  TITLE:= hcxkeys
  URL:=https://github.com/ZerBea/hcxkeys.git
  SUBMENU:=wireless
endef

define Package/hcxkeys/description
  Small set of tools to generate plainmasterkeys (rainbowtables)
  and hashes for the use with latest hashcat and latest John the Ripper.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ \
		$(TARGET_CONFIGURE_OPTS)
endef

define Package/hcxkeys/install
	$(INSTALL_DIR) $(1)/sbin
	$(CP) $(PKG_BUILD_DIR)/wlangenpmk	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/wlangenpmkocl	$(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/pwhash		$(1)/sbin/
endef

$(eval $(call BuildPackage,hcxkeys))
