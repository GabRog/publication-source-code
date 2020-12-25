#!/bin/bash
#"6","jsat.linear","/Users/grogowsk/master degree/publication-source-code/ultra-hard/JSAT/JSAT/src/jsat/linear/Matrix.java","3","29","Possible God Class (WMC=125, ATFD=56, TCC=0.000%)","Design","GodClass"
header='1s/.*/Package,File,Line,WMC,ATFD,TCC[%]/g;'
results='2,$s/(.*),(.*)\/src\/jsat(.*).java,(.*),(.*)WMC=(.*), ATFD=(.*), TCC=(.*)%)/\1,\3.java,\4,\6,\7,\8/g'

awk -F\",\" '/\"GodClass\"/ {print $2","$3","$5","$6}' results/csv/test.csv \
 | sed -E "$header$results" > WMC_ATFD_TCC.csv

 #(WOC=27.273%, NOPA=0, NOAM=6, WMC=12)","Design","DataClass"
 #NPath complexity of 4640, current threshold is 200","Design","NPathComplexity"