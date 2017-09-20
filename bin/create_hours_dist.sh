#!/bin/bash

#parameter to pass login data directory
directory=$1

#recursively collects and concatenates the failed login data into one file
grep -r "failed_login_data.txt" $directory| cat > failed_login_collective.txt

#Retrieves the time at which failed logins occurred and concatenates them into a temp file
awk '{print $2}' failed_login_collective.txt | sort | uniq -c| awk '{print "data.addRow([\x27"$2"\x27, $1]);"}'| cat > javascript_temp.txt

#wrapped the temp file in html to create chart
./bin/wrap_contents.sh javascript_temp.txt ./html_components/hours_dist hours_dist.html $directory

#removed scratch files
rm failed_login_collective.txt
rm javascript_temp.txt




