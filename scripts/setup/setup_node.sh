#!/bin/bash

crushtool -c crush_map_decompressed -o new_crush_map_compressed
ceph osd setcrushmap -i new_crush_map_compressed

sudo apt-get install gcc
sudo apt-get install make
sudo apt-get install pkg-config

cd ~

wget https://github.com/libfuse/libfuse/releases/download/fuse-2.9.7/fuse-2.9.7.tar.gz; tar -xvzf fuse-2.9.7.tar.gz; cd fuse-2.9.7/; ./configure; make -j33; sudo make install

sudo apt-get install -y gcc-5 g++-5; sudo update-alternatives; sudo update-alternatives --remove-all gcc; sudo update-alternatives --remove-all g++; sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20; sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20; sudo update-alternatives --config gcc; sudo update-alternatives --config g++;

cd ~/CORDS

make

cd ~

cp CORDS/scripts/setup/fuse.conf /etc/fuse.conf

mkdir trace
chmod 777 -R trace/
