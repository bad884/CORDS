#!/bin/bash

sudo systemctl stop ceph-osd.target

mkdir /home/ceph-admin/snapshots

# make journal backups
sudo dd if=/dev/sdb2 of=/home/ceph-admin/snapshots/sdb2_journal bs=1M conv=noerror,sync status=progress
sudo dd if=/dev/sdc2 of=/home/ceph-admin/snapshots/sdc2_journal bs=1M conv=noerror,sync status=progress
sudo dd if=/dev/sdd2 of=/home/ceph-admin/snapshots/sdd2_journal bs=1M conv=noerror,sync status=progress

sudo rm -rf /var/lib/ceph/osd/ceph-0.snapshot
sudo rm -rf /var/lib/ceph/osd/ceph-1.snapshot
sudo rm -rf /var/lib/ceph/osd/ceph-2.snapshot

# make data backups
sudo cp -a /var/lib/ceph/osd/ceph-0 /var/lib/ceph/osd/ceph-0.snapshot
sudo cp -a /var/lib/ceph/osd/ceph-1 /var/lib/ceph/osd/ceph-1.snapshot
sudo cp -a /var/lib/ceph/osd/ceph-2 /var/lib/ceph/osd/ceph-2.snapshot

sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0.snapshot
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1.snapshot
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2.snapshot

sudo chown root:root /var/lib/ceph/osd/ceph-0.snapshot/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1.snapshot/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2.snapshot/activate.monmap

