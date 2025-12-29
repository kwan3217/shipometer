#!/bin/sh

SERIAL_FILE=/home/chrisj/resetlogs/serial.txt

# Make sure that there is a serial number file
# Create the directory if it doesn't exist
mkdir -p "$(dirname "$SERIAL_FILE")"

# If the file doesn't exist, create it with the Pi's serial number
if [ ! -f "$SERIAL_FILE" ]; then
    # Extract the Raspberry Pi serial number from cpuinfo
    echo 0 > "$SERIAL_FILE"
    echo "Created serial file with value: $serial"
fi

#Increment the startup serial number -- number of times that we have restarted
echo `cat /home/chrisj/resetlogs/serial.txt`+1 | bc > /home/chrisj/resetlogs/serial.txt~
mv /home/chrisj/resetlogs/serial.txt~ /home/chrisj/resetlogs/serial.txt

source /home/chrisj/record_all.sh
