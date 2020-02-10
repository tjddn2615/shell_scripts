fs_type=f2fs
result_location=/home/swlee/apsys/log

#Normal Logging with Clean Storage

#Environment Configuration
mkdir /home/swlee/apsys/log
mkdir /home/swlee/apsys/log/1

umount /dev/sdb1

mkfs.$fs_type /dev/sdb1
mount -t f2fs /dev/sdb1 /home/swlee/mnt -o mode=lfs

cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_before_status.txt
sync;echo 3 > /proc/sys/vm/drop_caches

fio parameter > $result_location/fioNLC.txt
sleep 5s
cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_status_NLC.txt
cat /var/log/kern.log > $result_location/NLC.txt


#Threaded Logging
umount /dev/sdb1

mkfs.$fs_type /dev/sdb1
mount -t f2fs /dev/sdb1 /home/swlee/mnt

cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_before_status.txt 
sync;echo 3 > /proc/sys/vm/drop_caches

#hot area
iozone -I -w -+n -i 0 -t 4 -r 4k -s 7G -F /home/swlee/mnt/1 /home/swlee/mnt/2 /home/swlee/mnt/3 /home/swlee/mnt/4

rm /home/swlee/mnt/2
rm /home/swlee/mnt/4

#fragmentation examine
hdparm --fibmap /home/swlee/mnt/1 > $result_location/hdparm_TL.txt
cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_status.txt

sync
echo 3 > /proc/sys/vm/drop_caches
echo > /dev/null | sudo tee /var/log/kern.log

fio parameter > $result_location/fioTL.txt

sleep 5s

hdparm --fibmap /home/swlee/mnt/1 > $result_location/hdparm_TL.txt

cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_status_TL.txt
cat /var/log/kern.log > $result_location/TL.txt

#Normal Logging with Dirty Storage
umount /dev/sdb1

mkfs.$fs_type /dev/sdb1
mount -t f2fs /dev/sdb1 /home/swlee/mnt -o mode=lfs

cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_before_status.txt 
sync;echo 3 > /proc/sys/vm/drop_caches

#hot area
iozone -I -w -+n -i 0 -t 4 -r 4k -s 7G -F /home/swlee/mnt/1 /home/swlee/mnt/2 /home/swlee/mnt/3 /home/swlee/mnt/4

rm /home/swlee/mnt/2
rm /home/swlee/mnt/4

#fragmentation examine
hdparm --fibmap /home/swlee/mnt/1 > $result_location/hdparm_NLD.txt
cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_status.txt

sync
echo 3 > /proc/sys/vm/drop_caches
echo > /dev/null | sudo tee /var/log/kern.log

fio parameter > $result_location/fioNLD.txt

sleep 5s

hdparm --fibmap /home/swlee/mnt/1 > $result_location/hdparm_NLD.txt

cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_status_NLD.txt
cat /var/log/kern.log > $result_location/NLD.txt



