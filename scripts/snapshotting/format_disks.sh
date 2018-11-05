#!/bin/bash

# format drives for copy of journal
# sde
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk /dev/sde
  n # new partition
  p # primary partition
  1 # partition 1
  2048
  10487807
  w # write the partition table
EOF
# sdf
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk /dev/sdf
  n # new partition
  p # primary partition
  1 # partition 1
  2048
  10487807
  w # write the partition table
EOF
# sdg
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk /dev/sdg
  n # new partition
  p # primary partition
  1 # partition 1
  2048
  10487807
  w # write the partition table
EOF
