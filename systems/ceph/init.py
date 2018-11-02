#!/usr/bin/env python

import os
import rados
import sys


try:
        # cluster = rados.Rados(conffile = '/etc/ceph/ceph.conf', conf = dict (keyring = '/etc/ceph/ceph.client.admin.keyring'))
        cluster = rados.Rados(conffile = '/home/ceph-admin/CORDS/systems/ceph/confs/bradley/ceph.conf', conf = dict (keyring = '/etc/ceph/ceph.client.admin.keyring'))
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
