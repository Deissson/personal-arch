#!/bin/bash

# vars

DISK=vda #change it to your disk, "lsbk" to list all disks

# Partitioning:
function parting() {

echo '

		Create four partitions and a GPT part. scheme. 128MB for /boot, 32MB for UEFI ESP, 1024MB swap and the rest goes to /

		ORDER IS IMPORTANT!!
'
sleep 2
fdisk /dev/$DISK
sleep 2
echo 'if you didnt do it right its your fault'
sleep 2

}

parting


#Formating the newly created partitions 
#you can freely change the file systems
#Formating:
function format() {

	mkfs.ext4 /dev/$DISK'4'
sleep 1
	mkfs.vfat /dev/$DISK'2'
sleep 1
	mkfs.vfat /dev/$DISK'1'
sleep 1
	mkswap /dev/$DISK'3' && swapon /dev/$DISK'3'

}

format 


#Mounting all the partitions to /mnt
#Mount:
function mounting() {

	mount /dev/$DISK'4' /mnt
sleep 1
	mkdir /mnt/boot
sleep 1
	mount /dev/$DISK'1' /mnt/boot
sleep 1
	mkdir /mnt/boot/efi
sleep 1
	mount /dev/$DISK'2' /mnt/boot/efi

}

mounting

#Installing Base System
function base_install() {
	pacstrap /mnt base linux-zen linux-zen-headers linux-firmware efibootmgr grub networkmanager fish dash xdg-utils smartmontools wpa_supplicant wireless_tools iwd wget htop openssh vim nano
}

base_install

#FSTAB
function fstab_gen() {
	genfstab -U /mnt >> /mnt/etc/fstab
}

fstab_gen

#Setting localtime to israel
#setting locales to ru_RU.UTF-8 UTF-8 
#autochroot
function chroot_auto() {
	arch-chroot /mnt bash -c 'ln -sf /usr/share/zoneinfo/Israel /etc/localtime; hwclock --systohc; echo "ru_RU.UTF-8 UTF-8" >> /etc/local.gen; locale-gen; echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf; echo "xen-arch" >> /etc/hostname; grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB' umount -R /mnt 
}

chroot_auto
