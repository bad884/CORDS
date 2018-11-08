#!/bin/bash

sudo umount /var/lib/ceph/osd/ceph-0.mp
sudo umount /var/lib/ceph/osd/ceph-1.mp
sudo umount /var/lib/ceph/osd/ceph-2.mp

sudo rm -rf /var/lib/ceph/osd/ceph-0.mp
sudo rm -rf /var/lib/ceph/osd/ceph-1.mp
sudo rm -rf /var/lib/ceph/osd/ceph-2.mp

# copy data dirs
sudo -u ceph cp -a /var/lib/ceph/osd/ceph-0 /var/lib/ceph/osd/ceph-0.mp
sudo -u ceph cp -a /var/lib/ceph/osd/ceph-1 /var/lib/ceph/osd/ceph-1.mp
sudo -u ceph cp -a /var/lib/ceph/osd/ceph-2 /var/lib/ceph/osd/ceph-2.mp

# fix permissions
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0.mp
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1.mp
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2.mp

sudo chown root:root /var/lib/ceph/osd/ceph-0.mp/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1.mp/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2.mp/activate.monmap

