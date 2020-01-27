################################################################################
#
# nodejs-lbt
#
################################################################################

NODEJS_LBT_VERSION = 0.2.0
NODEJS_LBT_SITE = package/nodejs-lbt/src
NODEJS_LBT_SITE_METHOD = local
NODEJS_LBT_LICENSE = MIT
NODEJS_LBT_LICENSE_FILES = LICENSE
NODEJS_LBT_DEPENDENCIES = nodejs perl-feedgnuplot prl

DESTDIR = $(TARGET_DIR)/usr/lib/node_modules/lbt

define NODEJS_LBT_INSTALL_INIT_SYSV
	$(INSTALL) -m 755 -D $(@D)/S95lbt $(TARGET_DIR)/etc/init.d/S95lbt
endef

define NODEJS_LBT_INSTALL_INIT_SYSTEMD
	$(INSTALL) -m 644 -D $(@D)/lbt.service \
		$(TARGET_DIR)/usr/lib/systemd/system/lbt.service
endef

define NODEJS_LBT_INSTALL_TARGET_CMDS
	rm -rf $(DESTDIR)
	install -Dm0755 $(@D)/server.js   $(DESTDIR)/server.js
	install -Dm0644 $(@D)/client.js   $(DESTDIR)/client.js
	install -Dm0644 $(@D)/index.html  $(DESTDIR)/index.html
	install -Dm0644 $(@D)/config.json $(DESTDIR)/config.json
	install -Dm0644 $(@D)/id_rsa      $(DESTDIR)/id_rsa
	install -Dm0644 $(@D)/id_rsa.pub  $(DESTDIR)/id_rsa.pub
	# Put package.json in place so we can retrieve
	# its dependencies using npm
	install -Dm0644 $(@D)/package.json $(DESTDIR)/package.json
	(cd $(DESTDIR); $(NPM) install --only=production)
endef

$(eval $(generic-package))
