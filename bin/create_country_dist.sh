#!/bin/bash

directory=$1

cat grep -r "failed_login_data.txt" $directory > failed_login_collective.txt


awk '{print $5}' failed_login_collective.txt > ip_test.txt

join -1 1 -2 1 <(sort ip_test.txt) ./etc/country_IP_map.txt > country_code.txt

awk '{print $2}' country_code.txt| sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}'| cat > Country_output.txt

./bin/wrap_contents.sh Country_output.txt ./html_components/country_dist $directory/country_dist.html


rm failed_login_collective.txt
rm ip_test.txt
rm country_code.txt
rm Country_output.txt
