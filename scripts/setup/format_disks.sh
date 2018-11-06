#!/bin/bash

# format drives for copy of journal
# sde
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk /dev/sdb
  n # new partition
  p # primary partition
  1 # partition 1
  2048
  +100M
  n
  p
  2


  w # write the partition table
EOF
# sdf
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk /dev/sdc
  n # new partition
  p # primary partition
  1 # partition 1
  2048
  +100M
  n
  p
  2


  w # write the partition table
EOF
# sdg
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk /dev/sdd
  n # new partition
  p # primary partition
  1 # partition 1
  2048
  +100M
  n
  p
  2


  w # write the partition table
EOF
