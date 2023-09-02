#!/bin/bash

git clone https://aur.archlinux.org/yay.git
makepkg -si
git clone https://aur.archlinux.org/snapd.git
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
exit