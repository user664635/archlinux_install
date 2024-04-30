#!/bin/bash

reflector --save /etc/pacman.d/mirrorlist --sort rate --country China --protocol https --latest 5 &&
vim /etc/pacman.conf

packages=(base linux-{zen{,-headers},firmware} grub efibootmgr networkmanager base-devel neovim fish tmux git nvidia-dkms ntfs-3g)

cpu=$(lscpu | grep ID)
if [[ $cpu == *"AMD"* ]]; then
    packages=( "${packages[*]}" amd-ucode ) 
elif [[ $cpu == *"Intel"* ]]; then
    packages=( "${packages[*]}" intel-ucode ) 
fi

pacstrap -K /mnt ${packages[*]} &&

genfstab -U /mnt >> /mnt/etc/fstab &&

arch-chroot /mnt fish &&
umount -R /mnt &&
reboot

