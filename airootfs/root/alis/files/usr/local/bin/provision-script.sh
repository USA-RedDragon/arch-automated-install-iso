#!/bin/bash

# This script is used to provision the system after the installation is complete but before the packages are installed.

cat <<EOF >> /etc/pacman.conf
[usa-reddragon]
SigLevel = Required TrustedOnly
Server = https://raw.githubusercontent.com/USA-RedDragon/arch-packages/bins/\$arch
EOF

curl -fSsLo /tmp/usa-reddragon-keyring-20230501-6-any.pkg.tar.zst https://github.com/USA-RedDragon/arch-packages/raw/bins/x86_64/usa-reddragon-keyring-20230501-6-any.pkg.tar.zst
pacman --noconfirm -U /tmp/usa-reddragon-keyring-20230501-6-any.pkg.tar.zst
rm -f /tmp/usa-reddragon-keyring-20230501-6-any.pkg.tar.zst

pacman --noconfirm -Sy usa-reddragon-base sdrpp-git
yay --answerclean A --answerdiff N --answeredit N --answerupgrade Y -S visual-studio-code-bin icu69-bin xone-dkms xone-dongle-firmware protontricks proton-ge-custom-bin arduino-ide-bin find-the-command zoom plex-media-server-plexpass spotify betaflight-configurator slack-desktop ttf-ms-win11-auto


rm -f $0
