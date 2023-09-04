#!/bin/bash

cd
git clone https://aur.archlinux.org/yay.git
cd yay/ && makepkg -si
git clone https://aur.archlinux.org/snapd.git
cd snapd/ && makepkg -si
cd && sudo rm -r yay/

# Enable snap services in Arch Linux
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

echo
echo -e "Los repositorios: Snap y Yay se han instalado correctamente"
echo