#!/bin/bash 

#Creating directory parameter
directory=$1

#concatenate the files from the given directories into the designated file
cat $directory/username_dist.html hours_dist.html $directory/country_dist.html >> failed_login_summary_temp.html

#Wraps html header and footer onto login summary to make html chart
./bin/wrap_contents.sh failed_login_summary_temp.html ./html_components/summary_plots failed_login_summary.html $directory

#removes scratch file used to create chart
rm failed_login_summary_temp.html
