#!/bin/bash
mkdir scratch

#extracts recursively zip files from tgz and places contents into scratch directory for access.
for zip in $@
do

	zipdir=$(basename $zip .tgz)

	mkdir scratch/$zipdir

	tar -xzf $zip -C scratch/$zipdir

	./bin/process_client_logs.sh scratch/$zipdir
done

#Calling the functions we created on the files from the extraction
./bin/create_username_dist.sh scratch

./bin/create_hours_dist.sh scratch

./bin/create_country_dist.sh scratch

./bin/assemble_report.sh scratch

#removes scratch directory
rm -rf scratch


