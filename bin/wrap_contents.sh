#!/bin/bash

FileName=$1
HeaderFooterFileName=$2
FileOut=$3



cat ${HeaderFooterFileName}_header.html $FileName ${HeaderFooterFileName}_footer.html >> $FileOut
