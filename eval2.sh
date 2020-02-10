#!/bin/sh

complete=poll
path=/home/swlee/ksc2019/log
#index=9

#poll test
echo '1' > /sys/block/nvme1n1/queue/io_poll
echo '-1' > /sys/block/nvme1n1/queue/io_poll_delay

#for i in powersave performance 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000 2100000 2101000

for x in /sys/devices/system/cpu/cpu*/online; 
do
  echo 0 >"$x"
done
#echo 1 > /sys/devices/system/cpu/cpu1/online;

for index in 0 1 2 3 4 5 6 7 8 9
do
	echo ${index} > /proc/sys/kernel/pollo_threshold
	for i in ondemand 
	do
		if [ "${i}" = "ondemand" ]; then
			echo '2101000' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq; echo '1200000' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
			echo 'ondemand' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
			echo modchanged to ondemand
		fi
		echo scaling_max_freq changed
	
		echo fio ${i}_${complete}_${index} start
		date=`date --rfc-3339=seconds`
		echo $date
		#echo '0' > /sys/class/powercap/*/energy_uj	
		sleep 10s	
		#iostat -c 1 > ${path}/iostat_${i}_${complete}_${index}&
		#top -b -d 1 -n 180 > top_${i}_${complete}_${index} & 
		./freqcheck2.sh > ${path}/freq_${i}_${complete}_${index} &

		#sar 1 100 > ${path}/util_${i}_${complete}_${index} &

		#./watt2.sh > ${path}/watt_${i}_${complete}_${index} &


		sleep 20s
		a=$(cat /sys/class/powercap/*/energy_uj)
		fio intel.fio > ${path}/fio_${i}_${complete}_${index}
		b=$(cat /sys/class/powercap/*/energy_uj)
	
		#c=$((${b} - ${a}))
		echo $b - $a
		#echo $c
		date=`date --rfc-3339=seconds`
		echo $date
		echo fio end
		#pkill -9 -ef top 
		sleep 30s
		echo
		echo
	done
done
