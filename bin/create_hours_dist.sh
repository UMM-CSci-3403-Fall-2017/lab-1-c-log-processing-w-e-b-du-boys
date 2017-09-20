#!/bin/bash

directory=$1

cat grep -r "failed_login_data.txt" $directory > failed_login_collective.txt

awk '{print $2}' failed_login_collective.txt | sort | uniq -c| awk '{print "data.addRow([\x27"$2"\x27, $1]);"}'| cat > javascript_temp.txt

./bin/wrap_contents.sh javascript_temp.txt ./html_components/hours_dist hours_dist.html $directory

rm failed_login_collective.txt
rm javascript_temp.txt




