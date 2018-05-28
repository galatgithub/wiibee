#!/bin/bash
# file: extraTasks.sh
#
# This script will be launched in background after Witty Pi 2 get initialized.
# If you want to run your commands after boot, you can place them here.
#

#
# WiiBee mount and autorun USB
#
USB_DEV=/dev/sda1
USB_MNT=/mnt/bee1
logger "Check if USB disk $USB_DEV is plugged in"
[ -e $USB_DEV ] && logger "mount $USB_DEV" || exit 1
mount -o uid=pi,gid=pi $USB_DEV $USB_MNT
SCRIPT="autorun.sh"
USB_DIR="${USB_MNT}/wiibee"
[ -x "${USB_DIR}/${SCRIPT}" ] || exit 2

cd $USB_DIR
# TODO if we have connection, if update enabled, update scripts
# wget -q --spider http://pierriko.com/wiibee/update
# git fetch origin && git merge origin/master
export WIIBEE_SHUTDOWN=1
export PATH="${USB_DIR}:${PATH}"
. $SCRIPT 2>> autorun.log
