#!/bin/bash

cd
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd
sudo rm -r yay/
git clone https://aur.archlinux.org/snapd.git
cd snapd/
makepkg -si
cd
sudo rm -r snapd/
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap