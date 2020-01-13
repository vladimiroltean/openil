#!/usr/bin/env bash
# args from BR2_ROOTFS_POST_SCRIPT_ARGS
# $2 linux building directory
# $3 buildroot top directory
# $4 u-boot building directory

main()
{
	echo ${SKELETON_DIRE}

	cd ${TARGET_DIR}/lib/
	rm ld-linux-armhf.so.3
	ln -s arm-linux-gnueabihf/ld-2.27.so ld-linux-armhf.so.3

	exit $?
}

main $@
