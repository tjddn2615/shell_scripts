#!/bin/sh
SET=$(seq 0 127) 
for i in $SET
do echo 1 > /sys/devices/system/cpu/cpu$i/online; done
