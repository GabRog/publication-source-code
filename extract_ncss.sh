#!/bin/bash

awk -F, '/,"NcssCount"/' results/csv/test.csv | \
awk 'BEGIN{FS="\",\"";OFS=","} \
    BEGIN{print "Package,File,Line,MethodSignature,MethodName,MethodNCSS"} \
    {split($3,path,"JSAT/JSAT/src/jsat")} \
    {match($6,/'\''(.*)'\'' has a NCSS line count of ([0-9]+)/,metric)} \
   {match(metric[1], /(.*)\(/, name)} \
    {print $2,path[2],$5,metric[1],name[1],metric[2]}' \
> MethodNcss.csv