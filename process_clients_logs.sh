#!/bin/bash

Directory=$1

grepout=grep -r "Failed password" $Directory/cscirepo_secure/var/log

UserInfoOut= 

regexDateColon='(...... [0-9][0-9]:)'
regexUser='(?<=for )(.*)(?= from)'
regexIP='(?<=from )(.*)(?= port)'




