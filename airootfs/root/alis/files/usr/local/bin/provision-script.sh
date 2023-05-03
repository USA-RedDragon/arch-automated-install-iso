#!/bin/bash

# This script is used to provision the system after the installation is complete but before the packages are installed.

cat <<EOF >> /etc/pacman.conf
[usa-reddragon]
SigLevel = Required TrustedOnly
Server = https://raw.githubusercontent.com/USA-RedDragon/arch-packages/bins/\$arch
EOF

curl -fSsLo /tmp/usa-reddragon-keyring-20230501-5-any.pkg.tar.zst https://github.com/USA-RedDragon/arch-packages/raw/bins/x86_64/usa-reddragon-keyring-20230501-5-any.pkg.tar.zst
pacman --noconfirm -U /tmp/usa-reddragon-keyring-20230501-5-any.pkg.tar.zst
rm -f /tmp/usa-reddragon-keyring-20230501-5-any.pkg.tar.zst

rm -f $0
