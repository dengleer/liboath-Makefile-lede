#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=liboath
PKG_VERSION:=2.6.2
PKG_RELEASE:=1

PKG_SOURCE:=oath-toolkit-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.savannah.gnu.org/releases/oath-toolkit/
PKG_MD5SUM:=4a05cd4768764843bd5493609a6bdb17
PKG_BUILD_DIR:=$(BUILD_DIR)/oath-toolkit-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/liboath
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=OATH libraries
  URL:=http://www.nongnu.org/oath-toolkit/
endef

define Package/liboath/description
 This package contains a library for oath stuff
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/liboath/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/liboath/*.h $(1)/usr/include/liboath/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liboath.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/liboath.pc $(1)/usr/lib/pkgconfig/
endef

define Package/liboath/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liboath.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,liboath))
