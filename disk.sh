#!/bin/bash
# Update system
apt-get update
# Install parted and lvm2
apt-get install -y parted lvm2
# Create a new partition table using gpt on /dev/sdb (disk added in the VM)
parted -s /dev/sdb mklabel gpt
# Create a new partition logical using the entire disk
parted -s -a optimal /dev/sdb mkpart logical 0% 100%
# Set the partition as lvm
parted -s /dev/sdb 'set 1 lvm on'
# Create a physical volume using the new partition
pvcreate /dev/sdb1
# Create a new volume group using the new physical volume
vgcreate vg_vmdisk /dev/sdb1
# Create a new logical volume using the entire volume group
lvcreate -l 100%FREE vg_vmdisk -n lv_vmdisk
# Format the new logical volume as ext4
mkfs.ext4 /dev/vg_vmdisk/lv_vmdisk
# Create the directory where we are going to mount the new volume
mkdir /home/vagrant/vmdisk
# Mount the new volume in the directory created
mount /dev/vg_vmdisk/lv_vmdisk /home/vagrant/vmdisk
# Add the new volume to the fstab file to make it persistent after reboot
echo "/dev/vg_vmdisk/lv_vmdisk /home/vagrant/vmdisk ext4 defaults 0 0" | tee -a /etc/fstab
# Apply the changes in the fstab file
mount -a
