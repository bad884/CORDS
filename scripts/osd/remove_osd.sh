#!/bin/bash


ceph osd crush reweight "osd.$1" 0.0
ceph osd out $1
service ceph stop "osd.$1"
ceph osd crush remove "osd.$1"
ceph auth del "osd.$1"
ceph osd rm $1
