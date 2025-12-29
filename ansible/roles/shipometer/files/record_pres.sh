#!/bin/bash

tag=`date -u +%Y-%m-%d_%H-%M-%S`
year=`date -u +%Y`
month=`date -u +%m`
day=`date -u +%d`
mkdir -p /home/chrisj/preslog/$year/$month/$day
oufn=/home/chrisj/preslog/$year/$month/$day/preslog_$tag
chunktime=595
cd /home/chrisj/py_spi_sensors
python3 record_sensors.py -x $chunktime 2>&1 > ${oufn}.csv
xz -9v ${oufn}.csv




