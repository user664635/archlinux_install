#!/bin/bash

chsh -s /bin/fish
passwd &&

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ln -s /bin/nvim /bin/vi

systemctl enable NetworkManager
systemctl enable systemd-timesyncd.service

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo archlinux > /etc/hostname

vi /etc/mkinitcpio.conf
mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB &&
vi /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg &&

vi /etc/pacman.conf

visudo &&
read -p 'username:' username &&
useradd -mG wheel -s /bin/fish $username
passwd $username
