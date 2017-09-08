#!/bin/bash

Directory=$1

grepout= grep -rq "Failed password" $Directory


regexDateColon='[A-Z][a-z][a-z][ ].....'
regexUser='(?<=for )(.*)(?= from)'
regexIP='(?<=from )(.*)(?= port)'

grep -q '$regexDateColon|$regexUser|$regexIP' $grepout >> failed_login_data.text



