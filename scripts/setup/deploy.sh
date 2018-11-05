#!/bin/bash

# Make sure you can ssh to ceph node
# ssh ceph-admin@ceph

# Install ceph-deploy
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
sudo apt update
sudo apt install ceph-deploy

# Set up cluster
mkdir my-cluster
cd my-cluster
ceph-deploy new ceph
ceph-deploy install ceph
ceph-deploy mon create-initial
ceph-deploy admin ceph
ceph-deploy osd create ceph:sdb ceph:sdc ceph:sdd
