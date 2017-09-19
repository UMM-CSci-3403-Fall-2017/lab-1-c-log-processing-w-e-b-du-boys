#!/bin/bash

directory=$1

#for files in $directory/*;
#do 
#	if [-f $files/failed_login_data.txt];
#	then
 #     			cat $files/failed_login_data.txt >> $directory/failed_login_collective.txt		fi
#done

awk '{print $2}' $directory/failed_login_data.txt | '{count[$4]++}'| awk '{print "data.addRow([\x27"$2"\x27, "count"]);}'| cat > javascript_temp.txt

./bin/wrap_contents.sh javascript_temp.txt ./html_components/hours_dist hours_dist.html $directory

rm javascript_temp.txt




