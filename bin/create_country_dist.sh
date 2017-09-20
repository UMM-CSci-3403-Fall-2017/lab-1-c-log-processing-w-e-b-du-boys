#!/bin/bash

#directory parameter
directory=$1

#recursively collects designated files from specified directory and concatenates them into a single file.
grep -r "failed_login_data.txt" $directory| cat > failed_login_collective.txt

#retrieves ip's from designated field in failed login and puts them in their own file
awk '{print $5}' failed_login_collective.txt > ip_test.txt

#merges country IP list with the sorted ips into the required format
join -1 1 -2 1 <(sort ip_test.txt) ./etc/country_IP_map.txt > country_code.txt

#retrives country code from text file to be, sorted and counted, which must occur in order, and concatenates the count into country code text
awk '{print $2}' country_code.txt| sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}'| cat > Country_output.txt

#wraps country code text data in html to output as chart
./bin/wrap_contents.sh Country_output.txt ./html_components/country_dist $directory/country_dist.html

#removes superfluous files 
rm failed_login_collective.txt
rm ip_test.txt
rm country_code.txt
rm Country_output.txt
