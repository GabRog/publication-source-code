#!/bin/bash
header='1s/.*/Package,File,Line,CC/g;'
results='2,$s/(.*),(.*)\/src\/jsat(.*).java,(.*),T(.*)complexity of (.*)./\1,\3.java,\4,\6/g'

awk -F\",\" '/\"CyclomaticComplexity\"/ {print $2","$3","$5","$6}' results/csv/test.csv\
 | sed -E "$header$results" \
 > CyclomaticComplexity.csv