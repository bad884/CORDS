#!/bin/bash

# Initialize cluster?

# Stop all daemons
sudo ceph osd tree
echo "\nStop all daemons"
sudo systemctl stop ceph\*.service ceph\*.target

sleep 10

# Start all daemons
sudo ceph osd tree
echo "\nStart all daemons"
sudo systemctl start ceph.target

# Ceph HEALTH
sudo ceph health

# Delete all the CORDS trace files
# rm -rf cordslog*
# rm -rf trace*

# Delete Ceph workload directories
# rm -rf workload_dir*

# Create workload directories for 3 nodes/osds?
# mkdir workload_dir0
# mkdir workload_dir1
# mkdir workload_dir2

# Start the 3 nodes in the Ceph cluster
# $ZK_HOME/bin/zkServer.sh start $CURR_DIR/zoo0.cfg

# sleep 2

# Insert key value pairs to ZooKeeper
# value=$(printf 'a%.s' {1..8192})
# echo 'create /zk_test '$value > script
# $ZK_HOME"/bin/zkCli.sh" -server 127.0.0.2:2182 < script


# Kill all ZooKeeper instances
# rm -rf script
# pkill -f 'java.*zoo*'
# ps aux | grep zoo
# rm -rf zookeeper.out
