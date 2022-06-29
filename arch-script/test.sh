#!/bin/bash

#DISK=123

#echo $DISK 1


#    echo -e "${RED}Warning"'!'"${NC}"
#    echo -e "${RED}This script can delete all partitions of the persistent${NC}"
#    echo -e "${RED}storage and continuing all your data can be lost.${NC}"

#function parting() {

#echo 'Create four partitions. 128MB for /boot, 32MB for UEFI ESP, 1024MB swap and the rest goes to /'
#fdisk /dev/$DISK
#echo 'if you didnt do it right its your fault'

#}

#parting

#exec echo /dev/$DISK'1'


#exec sudo dnf upate && (echo dnf update failed failed; exit)
echo 'test' || { echo 'update failed' ; exit 1; }
