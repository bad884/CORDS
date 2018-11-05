#!/bin/bash

# create backup journals
sudo dd if=/dev/sde2 of=/dev/sdb2 bs=100M conv=noerror,sync status=progress
sudo dd if=/dev/sdf2 of=/dev/sdc2 bs=100M conv=noerror,sync status=progress
sudo dd if=/dev/sdg2 of=/dev/sdd2 bs=100M conv=noerror,sync status=progress

# create data backups
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-0.backup /var/lib/ceph/osd/ceph-0
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-1.backup /var/lib/ceph/osd/ceph-1
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-2.backup /var/lib/ceph/osd/ceph-2

sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2

sudo chown root:root /var/lib/ceph/osd/ceph-0/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2/activate.monmap

