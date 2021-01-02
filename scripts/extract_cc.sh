#!/bin/bash

#separately class and method cyclomatic complexity

#"9","jsat","/Users/grogowsk/master degree/publication-source-code/ultra-hard/JSAT/JSAT/src/jsat/DataSet.java","3","27","The class 'DataSet' has a total cyclomatic complexity of 120 (highest 12).","Design","CyclomaticComplexity"
#"263","jsat","/Users/grogowsk/master degree/publication-source-code/ultra-hard/JSAT/JSAT/src/jsat/DataSet.java","3","832","The method 'setWeight(int, double)' has a cyclomatic complexity of 12.","Design","CyclomaticComplexity"
#"20","jsat.linear","/Users/grogowsk/master degree/publication-source-code/ultra-hard/JSAT/JSAT/src/jsat/linear/Lanczos.java","3","33","The constructor 'Lanczos(Matrix, int, boolean, boolean)' has a cyclomatic complexity of 10.","Design","CyclomaticComplexity"

gawk -F, '/,"CyclomaticComplexity"/' ../results/csv/ultra-hard-02_01_2021.csv |
gawk -F, '/("The method)|("The constructor)/' | \
gawk 'BEGIN{FS="\",\"";OFS=","} \
    BEGIN{print "Package,File,Line,MethodSignature,MethodName,MethodCC"} \
    {split($3,path,"JSAT/JSAT")} \
    {match($6,/'\''(.*)'\'' has a cyclomatic complexity of ([0-9]+)./,cc)} \
    {match(cc[1], /(.*)\(/, name)} \
    {print $2,path[2],$5,cc[1],name[1],cc[2]}' \
> ../results/csv/02_01_2021/cc_method_02_01_2021.csv

gawk -F, '/,"CyclomaticComplexity"/' ../results/csv/ultra-hard-02_01_2021.csv |
gawk -F, '/"The class/' | \
gawk 'BEGIN{FS="\",\"";OFS=","} \
    BEGIN{print "Package,File,Line,ClassName,ClassCC,HighestCC"} \
    {split($3,path,"JSAT/JSAT")} \
    {match($6,/'\''(.*)'\'' has a total cyclomatic complexity of ([0-9]+) \(highest ([0-9]+)\)/,cc)} \
    {print $2,path[2],$5,cc[1],cc[2],cc[3]}' \
> ../results/csv/02_01_2021/cc_class_02_01_2021.csv

