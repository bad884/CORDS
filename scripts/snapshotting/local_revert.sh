#!/bin/bash

sudo systemctl stop ceph-osd.target

# make journal backups
sudo dd if=/home/ceph-admin/backups/sdb2_journal of=/dev/sdb2 bs=1M conv=noerror,sync status=progress
sudo dd if=/home/ceph-admin/backups/sdc2_journal of=/dev/sdc2 bs=1M conv=noerror,sync status=progress
sudo dd if=/home/ceph-admin/backups/sdd2_journal of=/dev/sdd2 bs=1M conv=noerror,sync status=progress

# make data backups

sudo rm -rf /var/lib/ceph/osd/ceph-0/*
sudo rm -rf /var/lib/ceph/osd/ceph-1/*
sudo rm -rf /var/lib/ceph/osd/ceph-2/*

sudo cp -a /home/ceph-admin/backups/ceph-0.backup/* /var/lib/ceph/osd/ceph-0
sudo cp -a /home/ceph-admin/backups/ceph-1.backup/* /var/lib/ceph/osd/ceph-1
sudo cp -a /home/ceph-admin/backups/ceph-2.backup/* /var/lib/ceph/osd/ceph-2

sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2

sudo chown root:root /var/lib/ceph/osd/ceph-0/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2/activate.monmap

sudo cp /home/ceph-admin/CORDS/scripts/setup/ceph.backup /etc/ceph/ceph.conf
