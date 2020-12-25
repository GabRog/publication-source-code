#!/bin/bash
header='1s/.*/Package,File,Line,MethodName,NCSS/g;'
results='2,$s/(.*),(.*)\/src\/jsat(.*).java,(.*),T(.*)'\''(.*)'\''(.*)line count of (.*)\./\1,\3.java,\4,\6,\8/g'

awk -F\",\" '/\"NcssCount\"/ {print $2","$3","$5","$6}' results/csv/test.csv \
 | sed -E "$header$results" \
 > Ncss.csv