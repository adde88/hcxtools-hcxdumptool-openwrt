#
# Copyright (C) 2021 Andreas Nilsen <adde88@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hcxtools-custom
PKG_VERSION:=6.2.5
PKG_RELEASE:=5
PKG_SOURCE_DATE:=2021-12-27

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=license.txt

PKG_CONFIG_DEPENDS:= CONFIG_HCXTOOLS_FULL

include $(INCLUDE_DIR)/package.mk
include ./files/*.mk

define Package/hcxtools-custom/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Wireless
  DEPENDS:=+libpcap +libopenssl
endef

define Package/hcxtools-custom/config
	source "$(SOURCE)/Config.in"
endef

define Package/hcxtools-full
$(call Package/hcxtools-custom/Default)
  DEPENDS+= @HCXTOOLS_FULL +libpthread +zlib +libcurl +python3-light
  TITLE:=hcxtools-full
  URL:=https://github.com/ZerBea/hcxdumptool
  VARIANT:=python3
endef

define Package/hcxtools-full/description
  This package includes all the tools made by @ZerBea
  Tools: hcxtools, hcxdumptool, and wifi_laboratory (hcxlabtools)
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./files/src-*/ $(PKG_BUILD_DIR)/
	$(call Build/Prepare/Default)
endef

define Build/RunMake
	CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)"
	$(MAKE) -C $(PKG_BUILD_DIR)/$(1) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		AR="$(TARGET_CROSS)gcc-ar"
	$(2)
endef

define Build/Compile/hcxtools-custom
	$(call Build/RunMake,src-hcxtools-custom)
	$(call Build/RunMake,src-hcxdumptool-custom)
	$(call Build/RunMake,src-hcxlabtools)
endef

define Build/Compile
	@echo "---------------------------------------------"
	@echo "-                                           -"
	@echo "-  COMPILING:    $(PKG_NAME)-$(PKG_VERSION) -"
	@echo "-  ARCHITECTURE: $(ARCH)                    -"
	@echo "-  BOARD:        $(BOARD)                   -"
	@echo "-  SUBTARGET:    $(SUBTARGET)               -"
	@echo "-                                           -"
	@echo "---------------------------------------------"
	sleep 4
	$(Build/Compile/hcxtools-custom)
	$(Build/Compile/full)
endef

define Package/hcxtools-full/install
	$(call Package/hcxtools-custom/install)
	$(call Package/hcxlabtools/install)
	$(call Package/hcxdumptool-custom/install)
endef

$(eval $(call BuildPackage,hcxtools-custom))
$(eval $(call BuildPackage,hcxdumptool-custom))
$(eval $(call BuildPackage,hcxlabtools))
$(eval $(call BuildPackage,hcxtools-full))
