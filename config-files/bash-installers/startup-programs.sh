#!/bin/bas

echo
echo -e "\e[1m !Wellcome to the bash installer!"
echo

# Desktop Enviroment
echo
echo -e "\e[33m 1) Desktop Enviroment"
echo -e "\e[95m You will be installing the next packages: \e[0mxorg, bspwm, sxhkd, lxappearance, picom, nitrogen, kitty, lightdm, lightdm-gtk-greeter, lightdm-gtk-greeter-settings and intel-ucode, reflector."
echo
sudo pacman -S xorg bspwm sxhkd lxappearance picom nitrogen kitty lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings intel-ucode reflector

# Terminal Tools
echo
echo -e "\e[33m 3) Terminal Tools"
echo -e "\e[95m You will be installing the next packages: \e[0mneovim, unzip, p7zip, unrar, tar, rsync, htop, exfat-utils, fuse-exfat, curl, wget, trash-cli, ranger, thefuck, tldr, gnome-keyring, usbutils, bash-completion, neofetch, vim, git, exa."
echo
sudo pacman -S neovim unzip p7zip unrar tar rsync htop exfat-utils fuse-exfat curl wget trash-cli ranger thefuck tldr gnome-keyring usbutils bash-completion neofetch vim git exa

# Basic Programs
echo
echo -e "\e[33m 4) Basic Programs"
echo -e "\e[95m You will be installing the next packages: \e[0mthunar, nautilus, dmenu, vlc, polybar, blueman, bluez-utils, jdk-openjdk, flatpak, gthumb, gedit."
echo
sudo pacman -S thunar nautilus dmenu vlc polybar blueman bluez-utils jdk-openjdk flatpak gthumb gedit

sudo pacman -R xdg-desktop-portal-gnome

echo
echo -e "\e[1m !All programs have been installed excessively!"
echo