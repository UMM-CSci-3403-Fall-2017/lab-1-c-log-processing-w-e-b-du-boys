#!/bin/bash 

directory=$1

cat $directory/username_dist.html hours_dist.html $directory/country_dist.html >> failed_login_summary_temp.html

./bin/wrap_contents.sh failed_login_summary_temp.html ./html_components/summary_plots failed_login_summary.html $directory

rm failed_login_summary_temp.html
