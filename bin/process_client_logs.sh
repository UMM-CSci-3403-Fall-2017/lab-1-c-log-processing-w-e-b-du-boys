#!/bin/bash

Directory=$1

#Initially we were going to use grep, piped into regex, piped into cat, however we found numerous errors
#and found awk to be much more intuitive for the problem, and so
#We used grep to search for desired results, and then extracted desired values with awk
grep -rh "Failed password" $Directory | awk '{if ($9 == "invalid") print $1, $2, substr($3,0,2), $11, $13; else print $1, $2, substr($3,0,2), $9, $11}'| cat >> $Directory/failed_login_data.txt


#Older regex that was going to be used to extract desired values, awk is more efficient
#regexDateColon='[A-Z][a-z][a-z][ ].....'
#regexUser='(?<=for )(.*)(?= from)'
#regexIP='(?<=from )(.*)(?= port)'

#grepout2= grep -q '$regexDateColon' <<< $grepout

#$grepout2 > failed_login_data.txt

#grep -q ($regexDateColon|$regexUser|$regexIP) $grepout >> failed_login_data.text


