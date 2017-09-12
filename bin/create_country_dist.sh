#!/bin/bash

directory=$1

for files in $directory/*;
do 
	if [ -f $files/failed_login_data.txt];
	then 
		cat $files/failed_login_data.txt >> $directory/failed_log_collective.txt
	fi
done

awk '{print $5}' $directory/failed_login_collective.txt| join 
