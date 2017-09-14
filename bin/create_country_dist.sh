#!/bin/bash

directory=$1

awk '{print $5}' $directory/failed_login_data.txt > ip_test.txt


join -1 1 -2 1 <(sort ip_test.txt) ../etc/country_IP_map.txt| awk '{print 4}'
