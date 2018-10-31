#!/usr/bin/env python

import os
import rados
import sys


# try:
#         cluster = rados.Rados(conffile='')
# except TypeError as e:
#         print 'Argument validation error: ', e
#         raise e

# print "Created cluster handle."

# try:
#         cluster.connect()
# except Exception as e:
#         print "connection error: ", e
#         raise e
# finally:
#         print "Connected to the cluster."


cluster = rados.Rados(conffile='ceph.conf')
print "\nlibrados version: " + str(cluster.version())
print "Will attempt to connect to: " + str(cluster.conf_get('mon initial members'))

cluster.connect()
print "\nCluster ID: " + cluster.get_fsid()

print "\n\nCluster Statistics"
print "=================="
cluster_stats = cluster.get_cluster_stats()

for key, value in cluster_stats.iteritems():
	print key, value
