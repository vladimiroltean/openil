#!/usr/bin/env bash

set -e -u -o pipefail

source board/nxp/common/post-image.sh

# args from BR2_ROOTFS_POST_SCRIPT_ARGS
# $2 linux building directory
# $3 buildroot top directory
# $4 u-boot building directory
main()
{
	cd ${3}

	# build the ramdisk rootfs
	mkimage -A arm -T ramdisk -C gzip -d \
		"${BINARIES_DIR}/rootfs.ext2.gz" \
		"${BINARIES_DIR}/rootfs.ext2.gz.uboot"

	do_genimage \
		"board/nxp/ls1028ardb/genimage.cfg.template" \
		"ls1028ardb-64b" \
		"NXP LS1028A-RDB" \
		"Image fsl-ls1028a-rdb.dtb ls1028a-dp-fw.bin version.json rootfs.ext2.gz.uboot"
}

main $@
