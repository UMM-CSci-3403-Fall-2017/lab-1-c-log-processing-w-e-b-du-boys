#!/bin/bash 

directory=$1

cat username_dist.html hours_dist.html country_dist.html >> failed_login_summary_temp.html

./bin/wrap_contents.sh failed_login_summary.html ./html_components/summary_plots failed_login_summary.html $directory

rm failed_login_summary_temp.html
