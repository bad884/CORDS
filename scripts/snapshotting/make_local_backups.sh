#!/bin/bash

mkdir /home/ceph-admin/backups

# make journal backups
sudo dd if=/dev/sdb2 of=/home/ceph-admin/backups/sdb2_journal bs=1M conv=noerror,sync status=progress
sudo dd if=/dev/sdc2 of=/home/ceph-admin/backups/sdc2_journal bs=1M conv=noerror,sync status=progress
sudo dd if=/dev/sdd2 of=/home/ceph-admin/backups/sdd2_journal bs=1M conv=noerror,sync status=progress

# make data backups
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-0 /home/ceph-admin/backups/ceph-0.backup
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-1 /home/ceph-admin/backups/ceph-1.backup
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-2 /home/ceph-admin/backups/ceph-2.backup

sudo chown -R ceph:ceph /home/ceph-admin/backups/ceph-0.backup
sudo chown -R ceph:ceph /home/ceph-admin/backups/ceph-1.backup
sudo chown -R ceph:ceph /home/ceph-admin/backups/ceph-2.backup

sudo chown root:root /home/ceph-admin/backups/ceph-0.backup/activate.monmap
sudo chown root:root /home/ceph-admin/backups/ceph-1.backup/activate.monmap
sudo chown root:root /home/ceph-admin/backups/ceph-2.backup/activate.monmap

