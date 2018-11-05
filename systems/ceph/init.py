#!/usr/bin/env python

import os
import rados
import sys

POOL_NAME = "test"
START_CMD = "sudo systemctl start ceph-osd.target"
STOP_CMD = "sudo systemctl stop ceph-osd.target"

os.system(START_CMD)

try:
        cluster = rados.Rados(conffile = '/etc/ceph/ceph.conf')
        # cluster = rados.Rados(conffile = '/home/ceph-admin/CORDS/systems/ceph/confs/bradley/ceph.conf', conf = dict (keyring = '/etc/ceph/ceph.client.admin.keyring'))
	print "Created cluster handle."
except TypeError as e:
        print 'Argument validation error: ', e
        raise e

print "Will attempt to connect to: " + str(cluster.conf_get('mon initial members'))
try:
        cluster.connect()
	print "Connected to the cluster."
except Exception as e:
        print "Connection error: ", e
        raise e

print "\nCluster ID: " + cluster.get_fsid()
print "Librados Version: " + str(cluster.version())

print "\nCluster Statistics"
print "=================="
cluster_stats = cluster.get_cluster_stats()

for key, value in cluster_stats.iteritems():
	print key, value

print "\nPools"
print "=================="
print cluster.list_pools()

if cluster.pool_exists(POOL_NAME):
	cluster.delete_pool(POOL_NAME)

print "=================="
print "CREATING POOL " + POOL_NAME
print "=================="
cluster.create_pool(POOL_NAME)
ioctx = cluster.open_ioctx(POOL_NAME)

print "=================="
print "WRITING DATA"
print "=================="
with open('/home/ceph-admin/CORDS/systems/ceph/testfile_8ka','r') as f:
        testfile_8ka = f.read()
        testfile_8ka = testfile_8ka.rstrip('\n')
        ioctx.write_full("testfile_8ka", testfile_8ka)

ioctx = cluster.open_ioctx(POOL_NAME)
read_data = ioctx.read("testfile_8ka")

if read_data == testfile_8ka:
	print('Correct')
else:
	print('Corrupt!')

ioctx.close()
print "=================="
print "IOCTX CLOSED"
print "=================="

os.system(STOP_CMD)
