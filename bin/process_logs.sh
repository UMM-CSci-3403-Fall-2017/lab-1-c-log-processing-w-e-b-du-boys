#!/bin/bash
mkdir scratch

for zip in $@
do

	zipdir=$(basename $zip .tgz)

	mkdir scratch/$zipdir

	tar -xzf $zip -C scratch/$zipdir

	./bin/process_client_logs.sh scratch/$zipdir
done

./bin/create_username_dist.sh scratch

./bin/create_hours_dist.sh scratch

./bin/create_country_dist.sh scratch

./bin/assemble_report.sh scratch

rm -rf scratch


