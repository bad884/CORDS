#!/bin/bash

# revert journals to initial state
sudo dd if=/dev/sde1 of=/dev/sdb2 bs=100M conv=noerror,sync status=progress
sudo dd if=/dev/sdf1 of=/dev/sdc2 bs=100M conv=noerror,sync status=progress
sudo dd if=/dev/sdg1 of=/dev/sdd2 bs=100M conv=noerror,sync status=progress

# revert data to initial state
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-0.snapshot /var/lib/ceph/osd/ceph-0
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-1.snapshot /var/lib/ceph/osd/ceph-1
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-2.snapshot /var/lib/ceph/osd/ceph-2

sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2

sudo chown root:root /var/lib/ceph/osd/ceph-0/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2/activate.monmap

