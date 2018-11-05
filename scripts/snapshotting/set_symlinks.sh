fs_uuid=$(sudo blkid -o value -s PARTUUID /dev/sde1)
sudo ln -s /dev/sde1 /dev/disk/by-partuuid/$fs_uuid

fs_uuid=$(sudo blkid -o value -s PARTUUID /dev/sdf1)
sudo ln -s /dev/sdf1 /dev/disk/by-partuuid/$fs_uuid

fs_uuid=$(sudo blkid -o value -s PARTUUID /dev/sdg1)
sudo ln -s /dev/sdg1 /dev/disk/by-partuuid/$fs_uuid 
