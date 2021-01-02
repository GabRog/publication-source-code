#!/bin/bash

awk -F, '/,"NcssCount"/' ../results/csv/ultra-hard-02_01_2021.csv | \
awk 'BEGIN{FS="\",\"";OFS=","} \
    BEGIN{print "Package,File,Line,MethodSignature,MethodName,MethodNCSS"} \
    {split($3,path,"JSAT/JSAT/src/jsat")} \
    {match($6,/'\''(.*)'\'' has a NCSS line count of ([0-9]+)/,metric)} \
   {match(metric[1], /(.*)\(/, name)} \
    {print $2,path[2],$5,metric[1],name[1],metric[2]}' \
> ../results/csv/02_01_2021/ncss_02_01_2021.csv