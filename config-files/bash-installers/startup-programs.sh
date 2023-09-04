#!/bin/bas

echo
echo -e "\e[1m !Wellcome to the bash installer!"
echo

# Desktop Enviroment
echo
echo -e "\e[33m 1) Desktop Enviroment"
echo -e "\e[95m You will be installing the next packages: \e[0mxorg, bspwm, sxhkd, lxappearance, picom, nitrogen, kitty, lightdm, lightdm-gtk-greeter, lightdm-gtk-greeter-settings and intel-ucode."
echo
sudo pacman -S xorg bspwm sxhkd lxappearance picom nitrogen kitty lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings intel-ucode

# Terminal Tools
echo
echo -e "\e[33m 2) Terminal Tools"
echo -e "\e[95m You will be installing the next packages: \e[0mneovim, gedit, unzip, p7zip, unrar, tar, rsync, htop, exfat-utils, fuse-exfat, curl, wget, trash-cli, ranger, thefuck, tldr, gnome-keyring, usbutils, gthumb, bash-completion, neofetch, vim, git."
echo
sudo pacman -S neovim gedit unzip p7zip unrar tar rsync htop exfat-utils fuse-exfat curl wget trash-cli ranger thefuck tldr gnome-keyring usbutils gthumb bash-completion neofetch vim git

# Basic Programs
echo
echo -e "\e[33m 3) Desktop Enviroment"
echo -e "\e[95m You will be installing the next packages: \e[0mthunar, nautilus, dmenu, vlc, polybar, blueman, bluez-utils, jdk-openjdk, flatpak."
echo
sudo pacman -S thunar nautilus dmenu vlc polybar blueman bluez-utils jdk-openjdk flatpak 

echo
echo -e "\e[1m !All programs have been installed excessively!"
echo