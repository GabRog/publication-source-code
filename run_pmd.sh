#!/bin/bash
for file in $(find ultra-hard/JSAT/JSAT/src/jsat -type f); do
    $(../pmd-bin-6.29.0/bin/run.sh pmd -d ${file} -f csv -R pmd_all_rules.xml -cache cache_new >> results/csv/test.csv)
done


