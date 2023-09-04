#!/bin/bash

sudo snap install code --classic
sudo snap install brave
sudo yay -S preload
sudo systemctl enable preload && sudo systemctl start preload

echo
echo -e "Las aplicaciones: \e[34mVisual Studio Code\e[39m, \e[33mPreload \e[39my \e[38;5;208mBrave \e[39mse han instalado correctamente" 
echo