sudo -u ceph cp -r /var/lib/ceph/osd/ceph-0 /var/lib/ceph/osd/ceph-0.mp
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-1 /var/lib/ceph/osd/ceph-1.mp
sudo -u ceph cp -r /var/lib/ceph/osd/ceph-2 /var/lib/ceph/osd/ceph-2.mp

sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-0.mp
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-1.mp
sudo chown -R ceph:ceph /var/lib/ceph/osd/ceph-2.mp

sudo chown root:root /var/lib/ceph/osd/ceph-0.mp/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-1.mp/activate.monmap
sudo chown root:root /var/lib/ceph/osd/ceph-2.mp/activate.monmap

