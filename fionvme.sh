for i in 1 2 3; do
	fio parameter_direct_off > ../log/nvme_d_off_$i
done

for i in 1 2 3; do
	fio parameter_rand_direct_off > ../log/nvme_d_off_r_$i
done

for i in 1 2 3; do
	fio parameter_don_1 > ../log/nvme_don_1_$i
done

for i in 1 2 3; do
	fio parameter_rand_don_1 > ../log/nvme_don_1_r_$i
done

for i in 1 2 3; do
	fio parameter_don_32 > ../log/nvme_don_32_$i
done

for i in 1 2 3; do
	fio parameter_rand_don_32 > ../log/nvme_don_32_r_$i
done







