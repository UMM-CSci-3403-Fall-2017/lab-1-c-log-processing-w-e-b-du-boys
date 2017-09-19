#!/bin/bash

directory=$1

awk '{print $5}' $directory/failed_login_data.txt > ip_test.txt


join -1 1 -2 1 <(sort ip_test.txt) ../etc/country_IP_map.txt| awk '{print $2}'| sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > Country_output.txt

./bin/wrap_contents.sh Country_output.txt html_components/country_dist $directory/country_dist.html
