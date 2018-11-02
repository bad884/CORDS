#!/usr/bin/env python

import os
import rados
import sys


# try:
#         # cluster = rados.Rados(conffile = '/etc/ceph/ceph.conf', conf = dict (keyring = '/etc/ceph/ceph.client.admin.keyring'))
#         cluster = rados.Rados(conf = dict (keyring = '/etc/ceph/ceph.client.admin.keyring'))
# 	print "Created cluster handle."
# except TypeError as e:
#         print 'Argument validation error: ', e
#         raise e

# try:
#         cluster.connect()
# 	print "Connected to the cluster."
# except Exception as e:
#         print "Connection error: ", e
#         raise e


##################################################
# cluster = rados.Rados()
cluster = rados.Rados(conf = dict (keyring = '/etc/ceph/ceph.client.admin.keyring'))
print "\nlibrados version: " + str(cluster.version())
print "Will attempt to connect to: " + str(cluster.conf_get('mon initial members'))

cluster.connect()
print "\nCluster ID: " + cluster.get_fsid()

print "\n\nCluster Statistics"
print "=================="
cluster_stats = cluster.get_cluster_stats()

for key, value in cluster_stats.iteritems():
	print key, value
