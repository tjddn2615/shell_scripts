fs_type=f2fs
result_location=/home/swlee/apsys/log

mkdir /home/swlee/apsys/log
mkdir /home/swlee/apsys/log/1

echo file format start

umount /dev/sdb1
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo unmount finish
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

mkfs.$fs_type /dev/sdb1
mount -t f2fs /dev/sdb1 /home/swlee/mnt -o mode=lfs
#mount /dev/sdb1 /home/swlee/mnt
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo mount finish
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx















