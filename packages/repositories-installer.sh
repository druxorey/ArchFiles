#!/bin/bash

cd
git clone https://aur.archlinux.org/yay.git
cd yay/ && makepkg -si
cd && sudo rm -r yay/

yay -S brave-bin 
yay -S visual-studio-code-bin
yay -S notion-app