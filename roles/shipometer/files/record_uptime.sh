#!/bin/bash
#Record the last startup time. We run this periodically so
#that we make sure to catch after the clock syncs to GPS.

#Get the serial number
serial=`cat /home/chrisj/resetlogs/serial.txt`
#calculate when we started up
unixtime=`date -u +%s.%N`
uptime=$(< /proc/uptime)
uptime=${uptime%% *}
start_unixtime=`echo ${unixtime:0:13}-$uptime | bc`
echo Restart at `date -u +%Y-%m-%dT%H:%M:%S.%NZ --date=@$start_unixtime`, Current time `date -u +%Y-%m-%dT%H:%M:%S.%NZ --date=@$unixtime`, up for $uptime seconds > /home/chrisj/resetlogs/resetlog.${serial}.txt
if [ ! -z "$1" ]
then
  echo "$@" >> /home/chrisj/resetlogs/resetlog.${serial}.txt
fi

