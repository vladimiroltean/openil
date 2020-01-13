#!/usr/bin/env bash

main()
{
	echo ${1}

	cd ${1}
	# remove the var/run runtime deirectory
	rm var/run

	# change the hostname to "OpenIL-Ubuntu-LS1028ARDB"
	sed -i 's/localhost.localdomain/OpenIL-Ubuntu-LS1028ARDB/' etc/hostname

	# enable the root user login
	sed -i 's/root:\*:/root::/' etc/shadow

	# workaround for ls1028ardb enetc phy issue in Linux kernel 4.19
	touch etc/rc.local
	chmod u+x etc/rc.local
	echo '#!/bin/sh -e' > etc/rc.local
	echo 'exit 0' >> etc/rc.local
	sed -i "/exit 0/i\echo '7 4 1 7' > /proc/sys/kernel/printk" etc/rc.local

	# create the link for mount and umount for the systemd
	ln -s /bin/mount usr/bin/mount
	ln -s /bin/umount usr/bin/umount

	exit $?
}

main $@
