swapon /dev/sda3
mount /dev/sda4 /mnt/gentoo
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev 
chroot /mnt/gentoo /bin/bash 
echo " Run the Following Commands to Complete Init: \n source /etc/profile \n export PS1=\"(chroot) ${PS1}\""
mount /dev/sda2 /boot
