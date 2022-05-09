#!/bin/bash
if [ "$1" == "" ] || [ "$2" == "" ]; then
echo
echo "Usage: $0 [filename] [offset from 0x8000000 in hex without 0x prefix]"
echo 
echo "e.g. : $0 myfw.bin 2000"
echo
echo "Example above pad the bin file that is meant to load at 0x8002000"
echo
exit  1
fi
if [ ! -f "$1" ]; then
echo "File $1 not found"
exit
fi



OFFSET=$((16#$2))
PADBYTES=$(($OFFSET-336))
OUTFILE=$1.padded
head -c 336 $1 > $OUTFILE

if [ $PADBYTES -lt 0 ]; then
echo "Offset needs to be at least 0x150"
exit
fi

head -c $PADBYTES /dev/zero >> $OUTFILE
cat $1 >> $OUTFILE



