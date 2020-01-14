################################################################################
#
# rcw image
#
################################################################################

RCW_VERSION = LSDK-19.09
RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
RCW_SITE_METHOD = git
RCW_LICENSE = BSD License
RCW_LICENSE_FILES = LICENSE

RCW_BIN = $(call qstrip,$(BR2_PACKAGE_RCW_BIN))
RCW_PLATFORM = $(firstword $(subst /, ,$(RCW_BIN)))

define RCW_BUILD_CMDS
	cd $(@D)/$(RCW_PLATFORM) && $(MAKE); \
	cp -f $(@D)/$(RCW_BIN) $(BINARIES_DIR);
endef

$(eval $(generic-package))
