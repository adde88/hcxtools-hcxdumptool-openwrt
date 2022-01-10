#
# Copyright (C) 2021 Andreas Nilsen <adde88@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

BUILD_DIR1="$(PKG_BUILD_DIR)/src-hcxtools-custom"

define Package/hcxtools-custom
$(call Package/hcxtools-custom/Default)
	DEPENDS+= +libpthread +zlib +libcurl +python3-light
	URL:=https://github.com/ZerBea/hcxtools
	TITLE:=hcxtools-custom
endef

define Package/hcxtools-custom/description
  Set of tools convert packets from captures (h = hash, c = capture, convert and calculate candidates, x = different hashtypes)
  for the use with latest hashcat or John the Ripper.
endef

define Package/hcxtools-custom/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxpcapngtool				$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxhashtool				$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxpsktool					$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxpmktool					$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxeiutool					$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxwltool					$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxhash2cap				$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/wlancap2wpasec				$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/whoismac					$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/usefulscripts/hcxgrep.py			$(1)/sbin/
	# Deprecated Tools Below
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxmactool					$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxessidtool				$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxpmkidtool				$(1)/sbin/
	$(INSTALL_BIN) $(BUILD_DIR1)/hcxhashcattool				$(1)/sbin/
endef
