# !!!! WARNING: THIS ARTICLE IS  STILL IN PROGRESS !!!!


# Arch Installation

Welcome to this guide on how to install Arch Linux on your computer. This guide is based on the official Arch Linux documentation. However, the guide also includes some changes and suggestions for using some different commands that can facilitate the process or better suit your preferences. This repository also provides you with some customization files and program files that you can use to customize your system once installed.

For more information, check out the official Arch Linux forum, where you'll find the official **Installation Guide**.

https://wiki.archlinux.org/title/installation_guide

# 1) Pre-Installation

The next section deals with initializing the arch before installing it on the system. Here, you'll need to run some commands to set up your keyboard and internet connection, plus some important additional information. These commands are essential for a successful installation and no problems later on.

### 1.1) Keyboard layout

To load a keyboard layout, you use the `setxkbmap` command followed by the language of your choice. In case you want to load the international english layout, the command would be as follows:

    $ setxkbmap us -variant intl

### 1.2) Network Configuration

***Note**: If the computer on which you are going to install Arch is connected by cable, you can skip the following part, as it is the configuration of the wireless connection.*

We are gonna use the tool `iwctl` will be used for the internet configuration

    $ iwctl

After executing the command you have to look for the technical name of your wifi card with the command `device list`, the name of your wifi card will be the one you will place in the **wlan** section.

    $ device list


    $ station <wlan> connect <Network Name>

***Note**: If your network is hidden, you must replace the `connect` with the `connect-hidden` attribute.*

After this, it is advisable to test the connection with the `ping` command.

# 2) Installation

If you want a simple installation, you can use **archinstall**, however this is not 100% reliable and I recommend installing it manually.

## 2.1) Partitioning disk

We are gonna use the `cfdisk` tool to partition the disk into three parts: boot, swap, and root. It is recommended that the label type be gpt, as it is the most common in UEFI systems. In addition, you probably already have partitions created from the previous operating system, so you will need to delete all partitions.

 - The boot partition is recommended to be 100M in size
 - The swap partition should be a power of 2 (2, 4, 8, 16 and so on), this depending on the size of the hard drive, in this case it is recommended that the swap be at least 8GB.
 - Use the rest of the hard drive for the root partition.

In the end, we are going to write the changes and then exit the cfdisk tool.

Con el comando lsblk puedes listar 


## Desktop inicialization

    $ sudo systemctl enable lightdm
    $ mkdir -p .config/{bspwm,sxhkd}
    $ install -Dm755 /usr/share/doc/bspwm/examples/bspwmrx .config/bspwm/
    $ install -Dm644 /usr/share/doc/sxhkd/examples/sxhkdrx .config/sxhkd/

# After Installation

## 1) Configure pacman

- In `sudo nano /etc/pacman.conf`
- Uncomment: `Color; ParallelDownloads = 5; IloveCandy`

## 2) How to run the bash shell

Run `startup-programs.sh` and `repositories-installer.sh` using the commands:

    $ sudo chmod +x (file)
    $ sh (file)