#!/bin/bash

# initial values
mkdir -p /home/$USER/Documents/speedtest/
save="/home/$USER/Documents/speedtest"
now=$(date +%Y-%m-%d_%H-%M-%S)
log="$save/$now.txt"
touch $log
# TODO calc data, display and write to log
totup=0
totdwn=0
count=0
avup=0
avdwn=0

# gather servers
speedtest --list > $save/serverlist.txt
# toss line 1
len=$(wc -l $save/serverlist.txt | cut -d " " -f 1)
((len=len-1))
tail -n $len $save/serverlist.txt > $save/list.txt

# TODO multifunction, no math on single
#Choose test:
#1) Single server
#2) Multi server

# currently testing top 3 servers returned
head -n 3 $save/list.txt > $save/serverlist.txt

# collect data
while read l; do
  echo "$l" 
  echo "$l" >> $log
  servernum=$(echo $l | cut -d ")" -f 1)
  speedtest --server $servernum > $save/result.txt
  up=$(grep "Download" $save/result.txt)
  down=$(grep "Upload" $save/result.txt)
  echo $up
  echo $down
  echo "$up" >> $log
  echo "$down" >> $log
  echo "-------------------------------------">>$log
done <$save/serverlist.txt
