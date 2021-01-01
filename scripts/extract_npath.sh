#!/bin/bash
#NPath complexity of 4640, current threshold is 200","Design","NPathComplexity"

gawk -F, '/,"NPathComplexity"/' results/csv/test.csv |
gawk 'BEGIN{FS="\",\"";OFS=","} \
    BEGIN{print "Package,File,Line,MethodSignature,MethodName,MethodNPath"} \
    {split($3,path,"JSAT/JSAT/src/jsat")} \
    {match($6,/'\''(.*)'\'' has an NPath complexity of ([0-9]+)/,metric)} \
    {match(metric[1], /(.*)\(/, name)} \
    {print $2,path[2],$5,metric[1],name[1],metric[2]}' \
> MethodConstructorNPath.csv