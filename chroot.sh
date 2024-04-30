#!/bin/bash

chsh -s /bin/fish
passwd &&

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ln -s /bin/nvim /bin/vi

systemctl enable NetworkManager
systemctl enable systemd-timesyncd.service

cd etc

echo "en_US.UTF-8 UTF-8" > locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > locale.conf
echo archlinux > hostname

vi mkinitcpio.conf
mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB &&
vi default/grub
grub-mkconfig -o /boot/grub/grub.cfg &&

vi pacman.conf

visudo &&
read -P 'username:' username &&
useradd -mG wheel -s /bin/fish $username &&
passwd $username
