#!/bin/bash

sudo pacman -S xorg bspwm sxhkd thunar lxappearance picom nautilus nitrogen sxhkd dmenu kitty lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings neovim
sudo systemctl enable lightdm
mkdir -p .config/{bspwm,sxhkd}
install -Dm755 /usr/share/doc/bspwm/examples/bspwmrx .config/bspwm/
install -Dm644 /usr/share/doc/sxhkd/examples/sxhkdrx .config/sxhkd/