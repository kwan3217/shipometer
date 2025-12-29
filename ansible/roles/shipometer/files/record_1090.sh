#!/bin/bash

tag=`date -u +%Y-%m-%d_%H-%M-%S`
year=`date -u +%Y`
month=`date -u +%m`
day=`date -u +%d`
host=fluttershy
oupath=/home/chrisj/aircraft/$year/$month/$day
mkdir -p $oupath
oufn=$oupath/${host}_$tag
chunktime=601
timeout $chunktime netcat $host 30002 > ${oufn}.1090 &
timeout $chunktime netcat $host 30003 > ${oufn}.sbs
xz ${oufn}.1090
xz ${oufn}.sbs




