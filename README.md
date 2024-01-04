## **Contents**   

0. [Introduction](#id0)
1. [Initial Configurations](#id1)
   1. [Keyboard layout](#id1.1)
   2. [Network Configuration](#id1.2)
2. [Pre-Installation](#id2)
   1. [Partitioning disk](#id2.1)
   2. [Formatting the Partitions](#id2.2)
   3. [Mounting the Partitions](#id2.3)
3. [Installation](#id3)
   1. [Basic packages](#id3.1)
   2. [File System Tab](#id3.2)
   3. [Switching to the Installed System (Changing Root)](#id3.3)
4. [Internal Configuration](#id4)
   1. [Setting the Time Zone](#id4.1)
   2. [Configuring Localization](#id4.2)
   3. [Configuring the Keyboard Layout (Keymap)](#id4.3)
   4. [Setting the Hostname](#id4.4)
   5. [Setting the Root Password](#id4.5)
   6. [Creating a New User](#id4.6)
   7. [Enabling Network Manager](#id4.7)
   8. [Installing the Bootloader](#id4.8)
   9. [Final Steps and Rebooting the System](#id4.9)
5. [Post-Installation Tasks](#id5)

---
 
# Arch Linux Installation Guide <a name='id0'></a>

Welcome to this guide to install Arch Linux on your computer. This tutorial is rooted in the official Arch Linux documentation, to ensure that you’re receiving accurate and up-to-date information.

In addition to the standard procedures, this guide introduces alternative commands and strategies designed to streamline the installation process and cater to your unique preferences. Whether you’re a seasoned Linux user or a newcomer to the world of open-source operating systems, you’ll find these modifications helpful in personalizing your Arch Linux experience.

Beyond the installation, this guide also serves as a resource for system customization. Included in this repository you will find various configuration files and program scripts that you can utilize to rice your system to your needs once the installation is complete.

For further information and support, the official Arch Linux forum is an invaluable resource. Here, you’ll find the official [**Installation Guide**](https://wiki.archlinux.org/title/installation_guide), along with a wealth of knowledge from the Arch Linux community.

# 1) Initial Configurations <a name='id1'></a>

The upcoming section focuses on initializing Arch Linux prior to its installation on the system. In this stage, you will be required to execute a series of commands to configure your keyboard and establish an internet connection, among other crucial settings. The successful execution of these commands is vital for a smooth installation process and to prevent potential issues in the future.

## 1.1) Keyboard layout <a name='id1.1'></a>

To load a specific keyboard layout, the `setxkbmap` command is utilized, followed by the desired language code. For instance, if you wish to load the international English layout, the command would be executed as follows:

    $ setxkbmap us -variant intl

## 1.2) Network Configuration <a name='id1.2'></a>

***Note**: If the computer on which you are going to install Arch is connected by cable, you can skip the following part, as it is the configuration of the wireless connection.*

We are gonna use the tool `iwctl` will be used for the internet configuration

    $ iwctl

After executing the command you have to look for the technical name of your wifi card with the command `device list`.

    $ device list

The name of your wifi card will be the one you will place in the **wlan** section.

    $ station <wlan> connect <Network Name>

***Note**: If your network is hidden, you must replace the `connect` with the `connect-hidden` attribute.*

After this, it is advisable to test the connection with the `ping` command.

# 2) Pre-Installation <a name='id2'></a>

If you want a simple installation, you can use **archinstall**, however this is not 100% reliable and I recommend installing it manually.

## 2.1) Partitioning disk <a name='id2.1'></a>

We will be using the `cfdisk` tool to partition the disk into three sections: boot, swap, and root. It is advisable to use the **gpt** label type, as it is prevalent in UEFI systems. If you have partitions already created from a previous operating system, you will need to delete all of them.

- **The boot partition**: It is recommended to allocate 100M for the boot partition. This partition is essential for the system to boot up.
- **The swap partition**: The size of the swap partition should be a power of 2 (2, 4, 8, 16, etc.), depending on the size of your hard drive. In this case, it is recommended that the swap partition be at least 8GB. The swap partition acts as an overflow for your system memory, ensuring smooth operation when your RAM is fully utilized.
- **The root partition**: Allocate the remaining hard drive space to the root partition. This partition will contain your operating system, applications, and files.

Once you have partitioned the disk, write the changes and exit the `cfdisk` tool.

To list the partitions and track your progress, use the `lsblk` command. This command is crucial for confirming the ID, size, and type of the partitions.

## 2.2) Formatting the Partitions <a name='id2.2'></a>

In this step, we will format the three partitions that we have created. 

1. **Root Partition**: The first partition we need to format is the root partition. This can be accomplished using the command below:

        $ mkfs.ext4 /dev/sda3

    This command formats the partition as an ext4 filesystem, which is a common choice for Linux installations due to its robustness and excellent performance.

2. **Boot Partition**: Next, we will format the boot partition. The boot partition is crucial for the system startup process. Use the following command to format it:

        $ mkfs.fat -F 32 /dev/sda1

    This command formats the partition with a FAT32 filesystem. FAT32 is commonly used for boot partitions as it is universally supported by almost all operating systems.

3. **Swap Partition**: Finally, we will set up the swap partition. The swap partition is used as a 'backup' for your system's physical memory, providing extra resources if your system runs out of RAM. Use the following command to format it:

        $ mkswap /dev/sda2

    This command initializes the partition to be used as swap space.

Remember to replace `/dev/sdaX` with your actual partition paths if they are different. Always double-check your commands before executing them to avoid data loss. 

## 2.3) Mounting the Partitions <a name='id2.3'></a>

In this step, we will be mounting the partitions. First, let's start with the **root** partition. You can mount it using the command below:

    $ mount /dev/sda3 /mnt

Next, we need to mount the **boot** partition. However, the required path does not exist yet. Therefore, we will create it using the following command:

    $ mkdir -p /mnt/boot/efi

With the path now created, we can proceed to mount the **boot** partition:

    $ mount /dev/sda1 /mnt/boot/efi

Lastly, the **swap** partition does not need to be mounted in the traditional sense. Instead, it needs to be activated. You can do this with the following command:

    $ swapon /dev/sda2

# 3) Installation <a name='id3'></a>

## 3.1) Basic packages <a name='id3.1'></a>

The installation process involves selecting the desired packages and mounting them in the `/mnt` directory. It is recommended to install at least the following packages: `base`, `linux`, `linux-firmware`, `base-devel`, `grub`, `efibootmgr`, `nano`, `networkmanager`, `git`, and `intel-ucode`.

***Note**: For those using an AMD processor, it's necessary to install the `amd-ucode` package instead of `intel-ucode`.*

To install these packages, use the command below:

    $ pacstrap /mnt base linux linux-firmware base-devel grub efibootmgr nano networkmanager git intel-ucode

This command will install the base system along with the Linux kernel and firmware, development tools, the GRUB bootloader, EFI boot manager, a basic text editor (nano), network manager, Git for version control, and microcode for Intel processors. Remember to replace `intel-ucode` with `amd-ucode` if you're using an AMD processor. This will ensure your system has the latest microcode updates from AMD. 

After running this command, your system should have all the necessary packages installed to proceed with the next steps of the Arch Linux installation process. Remember to check the official Arch Linux documentation for any updates or changes to the installation process.

Make sure that you have a working internet connection because **pacman** will download and install all of those packages from the repositories.

Sure, I'd be happy to help you improve and expand your Arch Linux installation guide. Here's a revised version of your text:

## 3.2) File System Tab <a name='id3.2'></a>

Once you've installed the necessary tools, the next step is to generate a **fstab** file. This file is crucial as it allows your system to automatically mount partitions upon booting. 

You can generate a **fstab** file using the following command:

    $ genfstab /mnt

This command will display information about the currently mounted files. However, you need to transfer this information to disk. To do this, you can redirect the output of the `genfstab` command to the **fstab** file located in the `/mnt/etc/` directory:

    $ genfstab /mnt > /mnt/etc/fstab

To ensure that the **fstab** file has been correctly generated, you can use the `cat` command to display its contents:

    $ cat /mnt/etc/fstab

The output should match the initial output of the `genfstab /mnt` command. If it does, then you've successfully generated your **fstab** file and are ready to proceed to the next step of the installation process.

## 3.3) Switching to the Installed System (Changing Root) <a name='id3.3'></a>

In this step, we will transition into our newly installed system environment. To do this, we use the following command:

    $ arch-chroot /mnt

# 4) Internal Configuration <a name='id4'></a>

## 4.1) Setting the Time Zone <a name='id4.1'></a>

The first step in our internal configuration process is to set the system's time zone. This can be done by creating a symbolic link between our desired time zone and `/etc/localtime`. Replace **Continent** and **Country** with your specific location. After setting the time zone, we will check the system date and synchronize the hardware clock with the system clock. The commands are as follows:

    $ ln -sf /usr/share/zoneinfo/Continent/Country /etc/localtime
    $ date
    $ hwclock --systohc

## 4.2) Configuring Localization <a name='id4.2'></a>

Next, we will configure the system's locale settings. This involves editing the `locale.gen` file to uncomment the line corresponding to our desired locale. In this case, we will be using `en_US.UTF-8 UTF-8`. After saving the changes, we generate the new locale configuration using the `locale-gen` command:

    $ nano /etc/locale.gen
    # Uncomment the line: en_US.UTF-8 UTF-8
    $ locale-gen

For certain programs to function correctly, we need to specify our locale in the `/etc/locale.conf` file. We can do this by adding the line `LANG=en_US.UTF-8` to the file. Here's the command to do it:

    echo LANG=en_US.UTF-8 > /etc/locale.conf

This command writes `LANG=en_US.UTF-8` to the `/etc/locale.conf` file. Now, your system-wide locale is set and will be recognized by all locale-aware programs on your system. Remember to replace `en_US.UTF-8` with your desired locale if it's different. 

## 4.3) Configuring the Keyboard Layout (Keymap) <a name='id4.3'></a>

If you're using an English keyboard, this step may not be necessary. However, if you need to change the keyboard layout, you can do so by modifying the `/etc/vconsole.conf` file. 

To set the keyboard layout to US English, add the following line to the file:

    $ echo KEYMAP=us > /etc/vconsole.conf

If you want to use a variant of the US layout, such as the international layout, you would add it like this:

    $ echo KEYMAP=us-acentos > /etc/vconsole.conf

Please replace `us-acentos` with your desired keymap. This command writes `KEYMAP=us-acentos` to the `/etc/vconsole.conf` file. Now, your system-wide keymap is set and will be recognized by your system.

## 4.4) Setting the Hostname <a name='id4.4'></a>

The hostname is a crucial aspect of your system configuration because it determines the internal name of your computer. To set the hostname, you need to access the file located at `/etc/hostname` and enter your desired name there. Here's how you can do it:

    $ echo YourDesiredHostname > /etc/hostname

Replace 'YourDesiredHostname' with the name you want to assign to your computer.

## 4.5) Setting the Root Password <a name='id.5'></a>

Setting the root password is a straightforward process, but it's vital for your system's security. The root password is what you'll use every time you need to perform tasks with root privileges, so it should be complex to prevent unauthorized access. 

You can set the root password using the `passwd` command. After entering the command, you'll be prompted to type your password twice to confirm it. Here's how you can do it:

    $ passwd
    # You'll be prompted to type your password twice

Remember, a strong password typically includes a mix of upper and lower case letters, numbers, and special characters.

Sure, I'd be happy to help you improve and expand your Arch Linux installation guide. Here's a revised version of your text:

## 4.6) Creating a New User <a name='id4.6'></a>

Firstly, we will use the `useradd` command with the `-m` flag, which instructs the system to create a `/home` directory for the new account. The `-G` option is used to specify the group that should own the user’s home directory, in this case, `wheel`. The `-s` option sets the default shell for the user, which we will set to `/bin/bash`. Replace '(name)' with the desired username. 

    $ useradd -m -G wheel -s /bin/bash (name)
    $ passwd (name)

Next, we will set up sudo for the new user. As it stands, if we switch to our new user using the `su (user)` command and attempt to execute a command with sudo (for example, `sudo pacman -Syu`), we will encounter an error after entering our password. 

To rectify this, we need to exit our current user session using either the `exit` command or `sudo su`. Then, we will open the sudoers file using the **visudo** command with our preferred editor set by the **EDITOR** environment variable:

    $ EDITOR=nano visudo

In the sudoers file, locate and uncomment the line `%wheel ALL=(ALL) ALL`. This grants all members of the **wheel** group full sudo privileges. 

Now, if we switch back to our new user and attempt to use sudo commands, we should be able to do so without encountering any errors.

## 4.7) Enabling Network Manager <a name='id4.7'></a>

To ensure that your system can connect to the internet, you'll need to enable the Network Manager. This can be done by running the following command in the terminal:

    $ systemctl enable NetworkManager

## 4.8) Installing the Bootloader <a name='id4.8'></a>

The next step, which is arguably the most crucial, involves installing a bootloader. Without a bootloader, your system will not be able to start. In this guide, we'll be using GRUB as our bootloader. To install GRUB, execute the following command:

    $ grub-install /dev/sda

After installing GRUB, it needs to be configured. This can be accomplished with the following command:

    $ grub-mkconfig -o /boot/grub/grub.cfg

## 4.9) Final Steps and Rebooting the System <a name='id4.9'></a>

Once GRUB has been configured, you can exit the root user, unmount all mounted filesystems, and reboot your system. This can be done by running the following commands:

    $ exit
    $ umount -a
    $ reboot

After rebooting, your Arch Linux installation should be complete and ready to use. Enjoy exploring your new system!

---

# 5) Post-Installation Tasks <a name='id5'></a>

Once the system is installed, it's recommended to retest the internet connection. This can be done using the `ping` command. The subsequent steps largely depend on the user's preferences, but it's generally advisable to set up a graphical environment for ease of use.

    $ ping -c 3 www.google.com

In the `/etc/pacman.conf` file, I highly recommend making a few adjustments to enhance your experience. First, find the line that reads `Color` and uncomment it. This will enable colored output, making it easier to read and understand the information displayed in your terminal. 

Next, look for `ParallelDownloads` and set its value to 5. This allows for multiple packages to be downloaded simultaneously, speeding up the installation process.

Finally, uncomment the `ILoveCandy` line. While this doesn't impact the functionality, it does replace the standard download progress bar with a fun, candy-themed one. It's a small touch, but it adds a bit of whimsy to your Arch Linux setup process."

This repository contains various configuration tools that can assist you. However, this guide will focus on installing the BSPWM desktop environment. If you prefer to use a different graphical environment, please refer to the official Arch Wiki, which provides comprehensive guides for installing various [desktop environments](https://wiki.archlinux.org/title/Desktop_environment).

Remember, the beauty of Arch Linux lies in its flexibility. You can customize your system to suit your preferences. Enjoy the journey of making Arch Linux your own!


<!-- 

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

 -->
