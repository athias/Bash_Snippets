#!/bin/bash
# Found these while looking for crap online and wanted to recod them for posterity

countdown(){
    date1=$((`date +%s` + $1));
    while [ "$date1" -ge `date +%s` ]; do 
    ## Is this more than 24h away?
    days=$(($(($(( $date1 - $(date +%s))) * 1 ))/86400))
    echo -ne "$days day(s) and $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r"; 
    sleep 0.1
    done
}
stopwatch(){
    date1=`date +%s`; 
    while true; do 
    days=$(( $(($(date +%s) - date1)) / 86400 ))
    echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
    done
}

if [[ $1 == "countdown" ]];then
  countdown $2
elif [[ $1 == "stopwatch" ]];then
  stopwatch
else
  printf "\nUsage is ./sw.sh (type) where type is:\n"
  printf "\tcountdown - to run a countdown timer\n"
  printf "\tstopwatch - to start a stopwatch\n"
  printf "\n"
  exit
fi
