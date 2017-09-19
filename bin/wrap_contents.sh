#!/bin/bash

FileName=$1
HeaderFooterFileName1=$2_header.html
HeaderFooterFileName2=$2_footer.html
FileOut=$3



cat $HeaderFooterFileName1 $FileName $HeaderFooterFileName2 > $FileOut
