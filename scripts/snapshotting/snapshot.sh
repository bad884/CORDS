#!/bin/bash

sudo -u ceph cp -r /var/lib/ceph/osd/ceph-0 /var/lib/ceph/osd/ceph-0.snapshot
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-1 /var/lib/ceph/osd/ceph-1.snapshot
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-2 /var/lib/ceph/osd/ceph-2.snapshot

sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0.snapshot
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1.snapshot
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2.snapshot

sudo chown root:root /var/lib/ceph/osd/ceph-0.snapshot/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1.snapshot/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2.snapshot/activate.monmap

fs_uuid=$(sudo blkid -o value -s PARTUUID /dev/sde1)
echo $fs_uuid > /var/lib/ceph/osd/ceph-0.snapshot/journal_uuid
ln -sf /dev/disk/by-partuuid/$fs_uuid /var/lib/ceph/osd/ceph-0.snapshot/journal

fs_uuid=$(sudo blkid -o value -s PARTUUID /dev/sdf1)
echo $fs_uuid > /var/lib/ceph/osd/ceph-1.snapshot/journal_uuid
ln -sf /dev/disk/by-partuuid/$fs_uuid /var/lib/ceph/osd/ceph-1.snapshot/journal

fs_uuid=$(sudo blkid -o value -s PARTUUID /dev/sdg1)
echo $fs_uuid > /var/lib/ceph/osd/ceph-2.snapshot/journal_uuid
ln -sf /dev/disk/by-partuuid/$fs_uuid /var/lib/ceph/osd/ceph-2.snapshot/journal
