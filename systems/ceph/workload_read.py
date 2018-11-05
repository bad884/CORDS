#!/usr/bin/env  python
import sys
import os
import rados

POOL_NAME = "test"
START_CMD = "sudo systemctl start ceph-osd.target"
STOP_CMD = "sudo systemctl stop ceph-osd.target"

os.system(START_CMD)

CURR_DIR = os.path.dirname(os.path.realpath(__file__))
if sys.argv[1] == 'trace':
	print 'we are in trace mode now'
	# assert(len(sys.argv) == 3)
	# format of sys.argv is sample_read.py trace workload_dir
elif sys.argv[1] == 'cords':
	print 'we are in cords mode now, injecting faults'
	assert(len(sys.argv) == 4)
	# format of sys.argv is sample_read.py cords workload_dir result_dir

# workload_dir = sys.argv[2]
# file = open(workload_dir + '/foo', 'r')

status = ''
POOL_NAME = "test"

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
os.system("sleep 5")
os.system("sudo cat /etc/ceph/ceph.conf")
os.system("sudo ceph osd tree")
os.system("sudo ceph -s")

ioctx = cluster.open_ioctx(POOL_NAME)

with open('/home/ceph-admin/CORDS/systems/ceph/testfile_8ka','r') as f:
        testfile_8ka = f.read()
        testfile_8ka = testfile_8ka.rstrip('\n')

read_data = ioctx.read("testfile_8ka")
# print(read_data)

if read_data == testfile_8ka:
	print('Correct')
else:
	print('Corrupt!')

ioctx.close()

os.system(STOP_CMD)

if sys.argv[1] == 'cords':
	result_dir = sys.argv[-1]
	# you can copy any files you need into this result_dir like application logs etc., or log additional data
	f = open(result_dir + '/status' , 'w')
	f.write(status)
	f.close()
