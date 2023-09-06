#!/bin/bash

sudo pacman -S base-devel
git clone https://aur.archlinux.org/microsoft-edge-stable-bin.git
cd microsoft-edge-stable-bin && makepkg -si
cd .. && sudo rm -r microsoft-edge-stable-bin

echo
echo -e "\e[1m!\e[32mMicrosoft \e[34mEdge \e[0mse ha instalado de manera exitosa!"
echo



