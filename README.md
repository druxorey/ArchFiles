# !!!! WARNING: THIS ARTICLE IS  STILL IN PROGRESS !!!!


# Arch Linux Installation Guide


Welcome to this guide on installing Arch Linux on your computer. This tutorial is rooted in the official Arch Linux documentation, ensuring that you’re receiving accurate and up-to-date information.

In addition to the standard procedures, this guide introduces alternative commands and strategies designed to streamline the installation process and cater to your unique preferences. Whether you’re a seasoned Linux user or a newcomer to the world of open-source operating systems, you’ll find these modifications helpful in personalizing your Arch Linux experience.

Beyond the installation, this guide also serves as a resource for system customization. Included in this repository are various configuration files and program scripts that you can utilize to rice your system to your needs once the installation is complete.

For further information and support, the official Arch Linux forum is an invaluable resource. Here, you’ll find the official **Installation Guide**, along with a wealth of knowledge from the Arch Linux community.


https://wiki.archlinux.org/title/installation_guide

# 1) Initial Configurations

The upcoming section focuses on initializing Arch Linux prior to its installation on the system. In this stage, you will be required to execute a series of commands to configure your keyboard and establish an internet connection, among other crucial settings. The successful execution of these commands is vital for a smooth installation process and to prevent potential issues in the future.

## 1.1) Keyboard layout

To load a specific keyboard layout, the `setxkbmap` command is utilized, followed by the desired language code. For instance, if you wish to load the international English layout, the command would be executed as follows:

    $ setxkbmap us -variant intl

## 1.2) Network Configuration

***Note**: If the computer on which you are going to install Arch is connected by cable, you can skip the following part, as it is the configuration of the wireless connection.*

We are gonna use the tool `iwctl` will be used for the internet configuration

    $ iwctl

After executing the command you have to look for the technical name of your wifi card with the command `device list`.

    $ device list

The name of your wifi card will be the one you will place in the **wlan** section.

    $ station <wlan> connect <Network Name>

***Note**: If your network is hidden, you must replace the `connect` with the `connect-hidden` attribute.*

After this, it is advisable to test the connection with the `ping` command.

# 2) Pre-Installation

If you want a simple installation, you can use **archinstall**, however this is not 100% reliable and I recommend installing it manually.

## 2.1) Partitioning disk

We will be using the `cfdisk` tool to partition the disk into three sections: boot, swap, and root. It is advisable to use the **gpt** label type, as it is prevalent in UEFI systems. If you have partitions already created from a previous operating system, you will need to delete all of them.

- **The boot partition**: It is recommended to allocate 100M for the boot partition. This partition is essential for the system to boot up.
- **The swap partition**: The size of the swap partition should be a power of 2 (2, 4, 8, 16, etc.), depending on the size of your hard drive. In this case, it is recommended that the swap partition be at least 8GB. The swap partition acts as an overflow for your system memory, ensuring smooth operation when your RAM is fully utilized.
- **The root partition**: Allocate the remaining hard drive space to the root partition. This partition will contain your operating system, applications, and files.

Once you have partitioned the disk, write the changes and exit the `cfdisk` tool.

To list the partitions and track your progress, use the `lsblk` command. This command is crucial for confirming the ID, size, and type of the partitions.

## 2.2) Formating the Partitions

You have to format the 3 partitions that we have made, first you have to format the **root** partition, this is done with the following command:

    $ mkfs.ext4 /dev/sda3

Then you need to format the boot partition with the following command:

    $ mkfs.fat -F 32 /dev/sda1

And finally let's format the swap partition:

    $ mkswap /dev/sda2


Sure, I'd be happy to help you improve and expand your Arch Linux installation guide. Here's a revised version of your text:

## 2.2) Formatting the Partitions

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

## 2.3) Mounting the Partitions

In this step, we will be mounting the partitions. First, let's start with the **root** partition. You can mount it using the command below:

    $ mount /dev/sda3 /mnt

Next, we need to mount the **boot** partition. However, the required path does not exist yet. Therefore, we will create it using the following command:

    $ mkdir -p /mnt/boot/efi

With the path now created, we can proceed to mount the **boot** partition:

    $ mount /dev/sda1 /mnt/boot/efi

Lastly, the **swap** partition does not need to be mounted in the traditional sense. Instead, it needs to be activated. You can do this with the following command:

    $ swapon /dev/sda2

# 3) Installation

## 3.1) Basic packages

The installation process involves selecting the desired packages and mounting them in the `/mnt` directory. It is recommended to install at least the following packages: `base`, `linux`, `linux-firmware`, `base-devel`, `grub`, `efibootmgr`, `nano`, `networkmanager`, `git`, and `intel-ucode`.

***Note**: For those using an AMD processor, it's necessary to install the `amd-ucode` package instead of `intel-ucode`.*

To install these packages, use the command below:

    $ pacstrap /mnt base linux linux-firmware base-devel grub efibootmgr nano networkmanager git intel-ucode

This command will install the base system along with the Linux kernel and firmware, development tools, the GRUB bootloader, EFI boot manager, a basic text editor (nano), network manager, Git for version control, and microcode for Intel processors. Remember to replace `intel-ucode` with `amd-ucode` if you're using an AMD processor. This will ensure your system has the latest microcode updates from AMD. 

After running this command, your system should have all the necessary packages installed to proceed with the next steps of the Arch Linux installation process. Remember to check the official Arch Linux documentation for any updates or changes to the installation process.

Make sure that you have a working internet connection because `pacman` will download and install all of those packages from the repositories.

Sure, I'd be happy to help you improve and expand your Arch Linux installation guide. Here's a revised version of your text:

## 3.2) File System Tab

Once you've installed the necessary tools, the next step is to generate a `fstab` file. This file is crucial as it allows your system to automatically mount partitions upon booting. 

You can generate a `fstab` file using the following command:

    $ genfstab /mnt

This command will display information about the currently mounted files. However, you need to transfer this information to disk. To do this, you can redirect the output of the `genfstab` command to the `fstab` file located in the `/mnt/etc/` directory:

    $ genfstab /mnt > /mnt/etc/fstab

To ensure that the `fstab` file has been correctly generated, you can use the `cat` command to display its contents:

    $ cat /mnt/etc/fstab

The output should match the initial output of the `genfstab /mnt` command. If it does, then you've successfully generated your `fstab` file and are ready to proceed to the next step of the installation process.

---

## 3.3) Switching to the Installed System (Changing Root)

In this step, we will transition into our newly installed system environment. To do this, we use the following command:

    $ arch-chroot /mnt

# 4) Internal Configuration

## 4.1) Setting the Time Zone

The first step in our internal configuration process is to set the system's time zone. This can be done by creating a symbolic link between our desired time zone and `/etc/localtime`. Replace **Continent** and **Country** with your specific location. After setting the time zone, we will check the system date and synchronize the hardware clock with the system clock. The commands are as follows:

    $ ln -sf /usr/share/zoneinfo/Continent/Country /etc/localtime
    $ date
    $ hwclock --systohc

## 4.2) Configuring Localization

Next, we will configure the system's locale settings. This involves editing the `locale.gen` file to uncomment the line corresponding to our desired locale. In this case, we will be using `en_US.UTF-8 UTF-8`. After saving the changes, we generate the new locale configuration using the `locale-gen` command:

    $ nano /etc/locale.gen
    # Uncomment the line: en_US.UTF-8 UTF-8
    $ locale-gen


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
