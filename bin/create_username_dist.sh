#!/bin/bash

#create a dn argument input 
directory=$1

#searching through all of the files in the specified directory
#for files in $directory/*;
#do 
	#if a file is a failed_login_data.txt file the it is joinging all of those files together. 
#	if [-f $files/failed_login_data.txt]; 
#	then
#		cat $files/failed_login_data.txt >> $directory/failed_login_collective.txt
#	fi
#done 

#The awk command is extracting the 4th group from the failed_login_collective.txt file, in other words it is extracting the username from each line.
#this is then sorted that only one entery for every unique username is added to the resulting to piped out information 
# this is all then piped into a file contating javascript commands, 
# the javascript command are then written to a txt file for temporary use

awk '{print $4}' $directory/failed_login_data.txt | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}'| cat > javascript_temp.txt
 
##this is all then passed to the wrap_contents.sh file that was created in the prelab
./bin/wrap_contents.sh javascript_temp.txt ./html_components/username_dist $directory/username_dist.html 

#the temporaru files are then removed. 
rm javascript_temp.txt

