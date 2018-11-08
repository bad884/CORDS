#!/bin/bash

sudo systemctl stop ceph-osd.target

# make journal backups
sudo dd if=/home/ceph-admin/snapshots/sdb2_journal of=/dev/sdb2 bs=1M conv=noerror,sync status=progress
sudo dd if=/home/ceph-admin/snapshots/sdc2_journal of=/dev/sdc2 bs=1M conv=noerror,sync status=progress
sudo dd if=/home/ceph-admin/snapshots/sdd2_journal of=/dev/sdd2 bs=1M conv=noerror,sync status=progress

# make data backups

sudo rm -rf /var/lib/ceph/osd/ceph-0/*
sudo rm -rf /var/lib/ceph/osd/ceph-1/*
sudo rm -rf /var/lib/ceph/osd/ceph-2/*

sudo cp -a /var/lib/ceph/osd/ceph-0.snapshot/* /var/lib/ceph/osd/ceph-0
sudo cp -a /var/lib/ceph/osd/ceph-1.snapshot/* /var/lib/ceph/osd/ceph-1
sudo cp -a /var/lib/ceph/osd/ceph-2.snapshot/* /var/lib/ceph/osd/ceph-2

sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2

sudo chown root:root /var/lib/ceph/osd/ceph-0/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2/activate.monmap

