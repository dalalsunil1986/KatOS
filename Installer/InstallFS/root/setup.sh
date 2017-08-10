#!/bin/sh

echo -e 'toor\ntoor\n' | passwd root

apk --root / --initdb add
apk update
apk add alpine-keys musl openssl busybox apk-tools
apk cache clean

clear
echo "KatOS has been installed. You may remove the LiveCD now."
echo "Press any key to reboot your computer..."
read -n1
reboot
