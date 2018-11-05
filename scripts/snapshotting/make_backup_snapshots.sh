#!/bin/bash

sudo -u ceph cp -r /var/lib/ceph/osd/ceph-0 /var/lib/ceph/osd/ceph-0.backup
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-1 /var/lib/ceph/osd/ceph-1.backup
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-2 /var/lib/ceph/osd/ceph-2.backup

sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0.backup
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1.backup
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2.backup

sudo chown root:root /var/lib/ceph/osd/ceph-0.backup/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1.backup/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2.backup/activate.monmap

