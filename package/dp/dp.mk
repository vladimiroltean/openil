################################################################################
#
# DP firmware for NXP layerscape platforms
#
################################################################################

DP_BIN = $(call qstrip,$(BR2_PACKAGE_DP_BIN))
 
define DP_BUILD_CMDS
	cd $(@D)/ && wget http://www.nxp.com/lgfiles/sdk/lsdk1909/firmware-cadence-lsdk1909.bin &&\
	chmod +x firmware-cadence-lsdk1909.bin && ./firmware-cadence-lsdk1909.bin --auto-accept && \
	$(INSTALL) -Dm0644 firmware-cadence-lsdk1909/dp/$(DP_BIN) $(BINARIES_DIR)/$(DP_BIN);
endef

$(eval $(generic-package))
