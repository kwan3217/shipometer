#!/bin/bash

tag=`date -u +%Y-%m-%d_%H-%M-%S`
year=`date -u +%Y`
month=`date -u +%m`
day=`date -u +%d`
mkdir -p /home/chrisj/templog/$year/$month/$day
oufn_temp=/home/chrisj/templog/$year/$month/$day/cputemp_$tag.csv
oufn_stat=/home/chrisj/templog/$year/$month/$day/cpustat_$tag.txt
(TZ=UTC mpstat -P ALL 5 120 > $oufn_stat; bzip2 $oufn_stat) &
echo time,temp degC,freq kHz,fan RPM >> $oufn_temp
for i in `seq 0 599`
do
  temp=`sensors -u | grep temp1_input: | head -n 1`
  echo `date -u +%Y-%m-%dT%H:%M:%S.%N`Z,${temp:15},`sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq`,`cat /sys/devices/platform/cooling_fan/hwmon/hwmon*/fan1_input` >> $oufn_temp
  sleep 1
done
xz $oufn_temp

