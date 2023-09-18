#!/bin/bash

cd
git clone https://aur.archlinux.org/yay.git
cd yay/ && makepkg -si
cd && sudo rm -r yay/

sudo yay -S brave-bin 
sudo yay -S visual-studio-code-bin
sudo yay -S notion-app