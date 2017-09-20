#!/bin/bash

#create a dn argument input 
directory=$1

#searching through all of the files in the specified directory

grep -r "failed_login_data.txt" $directory| cat > failed_login_collective.txt

#The awk command is extracting the 4th group from the failed_login_collective.txt file, in other words it is extracting the username from each line.
#this is then sorted that only one entery for every unique username is added to the resulting to piped out information 
# this is all then piped into a file contating javascript commands, 
# the javascript command are then written to a txt file for temporary use

awk '{print $4}' failed_login_collective.txt | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);"}'| cat > javascript_temp.txt
 
#this is all then passed to the wrap_contents.sh file that was created in the prelab
./bin/wrap_contents.sh javascript_temp.txt ./html_components/username_dist $directory/username_dist.html 

#the temporary files are then removed. 
rm failed_login_collective.txt
rm javascript_temp.txt
