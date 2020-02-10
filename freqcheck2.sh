#!/bin/bash

complete=poll
path=/home/yongju/sungwoo/log
mode=ondemand #pondemand

echo start cpufreq check

for i in {1..100}
do
	cat /proc/cpuinfo | grep MHz
	sleep 1s
done
