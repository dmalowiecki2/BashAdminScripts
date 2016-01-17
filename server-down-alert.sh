# created by Dominik Malowiecki http://wdrozenia.com
#
# Bash Monitoring script with alert played when server is not responding 
# to ping.
# Requirements:  festival software installed (apt-get install festival)
# servelist.txt file with fqdn server names


#!/bin/bash

echo "Checking servers communication"
for server in `cat serverlist.txt` ;
do 
server_status=""
echo "checking $server"
server_status=$(ping -W 1 -c 2 $server |grep icmp |wc -l ) 

if [ $server_status -eq 0 ]
then
echo "Server $server is DOWN"
echo "Server $server is DOWN please fix it" |festival --tts
else
echo "Server $server is UP, nothing to do"
fi
# Enable sleep when executing script in cron
# sleep 5
done
