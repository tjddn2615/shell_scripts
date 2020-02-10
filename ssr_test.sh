fs_type=f2fs
result_location=/home/swlee/apsys/log

cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_before_status.txt
sync;echo 3 > /proc/sys/vm/drop_caches

iozone -I -w -+n -i 0 -t 4 -r 4k -s 7G -F /home/swlee/mnt/1 /home/swlee/mnt/2 /home/swlee/mnt/3 /home/swlee/mnt/4

rm /home/swlee/mnt/2
rm /home/swlee/mnt/4

echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo iozone test over
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#hdparm --fibmap /home/swlee/mnt/1 > $result_location/hdparm_ssr.txt

cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_status.txt

sync
echo 3 > /proc/sys/vm/drop_caches

echo > /dev/null | sudo tee /var/log/kern.log



#fio parameter > $result_location/fio.txt
filebench -f /home/swlee/filebench/filebench-1.5-alpha3/workloads/fileserver.f 

sleep 5s

#hdparm --fibmap /home/swlee/mnt/1 > $result_location/hdparm_ssr2.txt

cat /sys/kernel/debug/f2fs/status > $result_location/f2fs_status_noflush.txt
cat /var/log/kern.log > $result_location/noflush.txt

echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  
echo hot file setup1 complete
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

