#!/bin/bash
#(WOC=27.273%, NOPA=0, NOAM=6, WMC=12)","Design","DataClass"

gawk -F, '/,"DataClass"/' ../results/csv/ultra-hard-02_01_2021.csv |
gawk 'BEGIN{FS="\",\"";OFS=","} \
    BEGIN{print "Package,File,Line,ClassName,WOC,NOPA,NOAM,WMC"} \
    {split($3,path,"JSAT/JSAT/src/jsat")} \
    {match($6,/'\''(.*)'\'' (.*) \(WOC=(.*)%, NOPA=(.*), NOAM=(.*), WMC=(.*)\)/,metrics)} \
    {woc=metrics[3]; nopa=metrics[4]; noam=metrics[5];  wmc=metrics[6]}
    {print $2,path[2],$5,metrics[1],woc,nopa,noam,wmc}' \
> ../results/csv/02_01_2021/wmc_02_01_2020.csv