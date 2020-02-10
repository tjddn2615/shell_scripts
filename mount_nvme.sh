#!/bin/sh

  
    umount /home/swlee/mnt
    echo umount finish
    mkfs.ext4 /dev/nvme0n1
    mount -t ext4 /dev/nvme0n1 /home/swlee/mnt
    echo mount finish

    fstrim / -v

