#!/bin/bash

read -p 'update mirrorlist? (y/n):' yn
case $yn in
    y)
        reflector --save /etc/pacman.d/mirrorlist --sort rate --country GB --protocol https --latest 5
        ;;
    n)
        ;;
    *)
        exit
esac

pacman -Syu
pacman -S fish tmux nginx-mainline

ln -s /bin/vim /bin/vi 
visudo

read -P 'username:' username &&
useradd -mG wheel -s /bin/fish $username &&
passwd $username

read -P 'ssh port:' ssh_port
ufw allow $ssh_port

vi /etc/ssh/sshd_config
systemctl restart sshd 

systemctl enable --now nginx
ufw allow 443
ufw allow 80
