#!/bin/bash
for file in $(find ../ultra-hard/JSAT/JSAT -type f); do
    $(../../pmd-bin-6.29.0/bin/run.sh pmd -d ${file} -f csv -R pmd_all_rules.xml -cache cache_new >> ../results/csv/temp.csv)
done

now=$(date +"%d_%m_%Y")
awk '!seen[$0]++' ../results/csv/temp.csv > ../results/csv/ultra-hard-${now}.csv
rm ../results/csv/temp.csv

chmod +rwx ../results/csv/ultra-hard-${now}.csv


