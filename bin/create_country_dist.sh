#!/bin/bash

directory=$1

awk '{print $5}' $directory/failed_login_data.txt >> ip_test.txt|sort

join -1 1 -2 1 ip_test.txt ../etc/country_IP_map.txt > country_mapped.txt

