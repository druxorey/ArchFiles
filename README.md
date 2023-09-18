# Arch Configuration

This repository contains Arch Linux configuration files and application configurations that can be useful for customizing the operating system and optimizing performance. The files include scripts, aliases, environment variables, and other settings. The repository is organized by folders based on file or application type.

# Arch Inicialization

## 1) Network Configuration

    $ iwctl
    $ station <wlan> connect-hidden <Network Name>

## 2) Packages Configuration

### Configure pacman

- In `sudo nano /etc/pacman.conf`
- Uncomment: `Color; ParallelDownloads = 5; IloveCandy`

### Install and update basic packages

    $ sudo pacman -S git nano
    $ sudo pacman -Syu

## 3) Run the bash shell

Run `startup-programs.sh` and `repositories-installer.sh` using the commands:

    $ sudo chmod +x (file)
    $ sh (file)

## 4) Desktop inicialization

    $ sudo systemctl enable lightdm`
    $ mkdir -p .config/{bspwm,sxhkd}`
    $ install -Dm755 /usr/share/doc/bspwm/examples/bspwmrx .config/bspwm/
    $ install -Dm644 /usr/share/doc/sxhkd/examples/sxhkdrx .config/sxhkd/

## 5) Move de configuration files

> **Warning:** Remember to execute the commands in step 3 when copying a configuration file
