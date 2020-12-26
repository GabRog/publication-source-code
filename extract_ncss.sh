#!/bin/bash

awk -F, '/\"NcssCount\"/' results/csv/test.csv |
awk 'BEGIN{FS="\",\"";OFS=","} \
    BEGIN{print "Package,File,Line,MethodName,NCSS"} \
    {split($3,path,"JSAT\/JSAT"); $3=path[2]} \
    {split($6,method,"'\''")} \
    {split($6,metric," of ")} \
    {split(metric[2],ncss,".")} \
    {print $2,$3,$5,method[2],ncss[1]}' \
> Ncss.csv