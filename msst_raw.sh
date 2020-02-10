
for i in 1 2 3; do
	echo sync start
	sync; echo 3 > /proc/sys/vm/drop_caches;
	echo sync completed
	sleep 10s
	for j in sdd; do
		blktrace -d /dev/${j}1 -o - | blkparse *********-i - -a issue -o ../log/blktrace_msst1_${j}_$i &
	done
	sleep 10s
	fio parameter1 > ../log/msst1_$i
	sleep 10s
	pkill -15 -ef blktrace
done

for i in 1 2 3; do
	echo sync start
	sync; echo 3 > /proc/sys/vm/drop_caches;
	echo sync completed
	sleep 100s
	for j in sdd; do
		blktrace -d /dev/${j}1 -o - | blkparse *********-i - -a issue -o ../log/blktrace_msst2_${j}_$i &
	done;
	fio parameter2 > ../log/msst2_$i
	sleep 10s
	pkill -15 -ef blktrace
done

for i in 1 2 3; do
	echo sync start
	sync; echo 3 > /proc/sys/vm/drop_caches;
	echo sync completed
	sleep 100s
	for j in sdd; do
		blktrace -d /dev/${j}1 -o - | blkparse *********-i - -a issue -o ../log/blktrace_msst3_${j}_$i &
	done;
	fio parameter3 > ../log/msst3_$i
	pkill -15 -ef blktrace

done

for i in 1 2 3; do
	echo sync start
	sync; echo 3 > /proc/sys/vm/drop_caches;
	echo sync completed
	sleep 100s
	for j in sdd; do
		blktrace -d /dev/${j}1 -o - | blkparse *********-i - -a issue -o ../log/blktrace_msst4_${j}_$i &
	done;
	fio parameter4 > ../log/msst4_$i
	pkill -15 -ef blktrace

done

for i in 1 2 3; do
	echo sync start
	sync; echo 3 > /proc/sys/vm/drop_caches;
	echo sync completed
	sleep 100s
	for j in sdd; do
		blktrace -d /dev/${j}1 -o - | blkparse *********-i - -a issue -o ../log/blktrace_msst5_${j}_$i &
	done;
	fio parameter5 > ../log/msst5_$i
	pkill -15 -ef blktrace

done

