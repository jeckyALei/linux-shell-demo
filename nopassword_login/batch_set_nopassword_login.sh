#!/bin/sh
if [ -z $* ];then
   echo "Usage: $0 <ipfile> <username> <password>"
   exit
fi
ipspath="$1"
username="$2"
userpwd="$3"
successfile="./success"
failedfile="./failed"
rm -rf $successfile
rm -rf $failedfile
for ip in $(cat $ipspath)
do
    echo "<<<<<<<<<<<<<<<<<<<<<<<<<$ip<<<<<<<<<<<<<<<<<<<<"
    ./run.exp $username $userpwd $ip
    if [ $? -eq 0 ];then
           echo $ip >> $successfile
    else
           echo $ip >> $failedfile
    fi
	
	
done
