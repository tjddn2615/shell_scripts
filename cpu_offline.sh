#!/bin/sh
SET=$(seq $1 127)
for i in $SET
do echo 0 > /sys/devices/system/cpu/cpu$i/online; done
