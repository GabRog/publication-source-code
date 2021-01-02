#!/bin/bash
awk -F, '/\"GodClass\"/' ../results/csv/ultra-hard-02_01_2021.csv |
awk 'BEGIN{FS="\",\"";OFS=","} \
    BEGIN{print "Package,Path,Line,WMC,ATFD,TCC"} \
    {split($3,path,"JSAT\/JSAT"); $3=path[2]} \
    {split($6,metric,"=")} \
    {split(metric[2],wmc,",")} \
    {split(metric[3],atfd,",");} \
    {split(metric[4],tcc,"%");} \
    {print $2,$3,$5,wmc[1],atfd[1],tcc[1]}' \
> ../results/csv/02_01_2021/wmc_02_01_2021.csv