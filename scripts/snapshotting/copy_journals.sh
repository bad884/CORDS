#!/bin/bash

# copy journals to extra disk for backup
sudo dd if=/dev/sdb2 of=/dev/sde1 bs=64K conv=noerror,sync status=progress
sudo dd if=/dev/sdc2 of=/dev/sdf1 bs=64K conv=noerror,sync status=progress
sudo dd if=/dev/sdd2 of=/dev/sdg1 bs=64K conv=noerror,sync status=progress
