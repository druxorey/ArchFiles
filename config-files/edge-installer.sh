#!/bin/bash

pacman -S base-devel
git clone https://aur.archlinux.org/microsoft-edge-stable-bin.git
cd microsoft-edge-stable-bin && makepkg -si -noconfirm
cd ..
sudo rm -r microsoft-edge-stable-bin
exit