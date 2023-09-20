#!/bin/bas

echo
echo -e "\e[1m !Wellcome to the bash installer!"
echo

# Desktop Enviroment
echo
echo -e "\e[33m 1) Desktop Enviroment"
echo -e "\e[95m You will be installing the next packages: \e[0mxorg, bspwm, sxhkd, lxappearance, picom, nitrogen, kitty, lightdm, lightdm-gtk-greeter, lightdm-gtk-greeter-settings, intel-ucode, reflector and libinput."
echo
sudo pacman -S xorg bspwm sxhkd lxappearance picom nitrogen kitty lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings intel-ucode reflector libinput

# Terminal Tools
echo
echo -e "\e[33m 32) Terminal Tools"
echo -e "\e[95m You will be installing the next packages: \e[0mneovim, gedit, unzip, p7zip, unrar, tar, rsync, htop, exfat-utils, fuse-exfat, curl, wget, trash-cli, ranger, thefuck, tldr, gnome-keyring, usbutils, gthumb, bash-completion, neofetch, vim, git, bat, btop, speedtest-cli and imagemagick."
echo
sudo pacman -S neovim gedit unzip p7zip unrar tar rsync htop exfat-utils fuse-exfat curl wget trash-cli ranger thefuck tldr gnome-keyring usbutils gthumb bash-completion neofetch vim git bat btop speedtest-cli imagemagick

# Basic Programs
echo
echo -e "\e[33m 3 Basic Programs"
echo -e "\e[95m You will be installing the next packages: \e[0mthunar, nautilus, dmenu, vlc, polybar, blueman, bluez-utils, jdk-openjdk and flatpak."
echo
sudo pacman -S thunar nautilus dmenu vlc polybar blueman bluez-utils jdk-openjdk flatpak 

sudo pacman -R xdg-desktop-portal-gnome

echo
echo -e "\e[1m !All programs have been installed excessively!"
echo