#!/bin/bash

sudo pacman -S base-devel
git clone https://aur.archlinux.org/microsoft-edge-stable-bin.git
cd microsoft-edge-stable-bin && makepkg -si
cd ..
sudo rm -r microsoft-edge-stable-bin
echo ¡Microsoft Edge se ha instalado de manera exitosa!
exit