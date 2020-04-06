################################################################################
#
# tsn-scripts
#
################################################################################

TSN_SCRIPTS_VERSION = isochron
TSN_SCRIPTS_SITE = https://github.com/vladimiroltean/tsn-scripts.git
TSN_SCRIPTS_SITE_METHOD = git
TSN_SCRIPTS_LICENSE = GPL2.0
TSN_SCRIPTS_LICENSE_FILES = COPYING
TSN_SCRIPTS_DEPENDENCIES = jq

define TSN_SCRIPTS_BUILD_CMDS
	$(TARGET_CONFIGURE_ARGS) $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) \
		$(MAKE) -j1 $(TARGET_MAKE_OPTS) -C $(@D)/isochron
endef

define TSN_SCRIPTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/isochron/isochron \
		$(TARGET_DIR)/usr/sbin/isochron
endef

$(eval $(generic-package))
