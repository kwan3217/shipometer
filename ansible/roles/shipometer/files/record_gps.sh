#!/bin/bash

tag=`date -u +%Y-%m-%d_%H-%M-%S`
year=`date -u +%Y`
month=`date -u +%m`
day=`date -u +%d`
mkdir -p /home/chrisj/FluttershyBase/$year/$month/$day
oufn=/home/chrisj/FluttershyBase/$year/$month/$day/fluttershy_$tag
chunktime=601
gpspipe -P -R -x $chunktime > ${oufn}.ubx &
gpspipe -P -r -x $chunktime > ${oufn}.ubx_nmea &
wait
xz ${oufn}.ubx
xz -9v ${oufn}.ubx_nmea




