#!/bin/bash

: '
now=`date +"%Y/%m/%d"` ; 
end=`date +"%Y/%m/%d" -d "+ $(( 365*2 )) days"`;
echo $end 
while [ "$now" != "$end" ] ; do 
    now=`date +"%Y/%m/%d" -d "$now + 1 day"`; 
    echo "$now"; 
done
'
#: '

generate_Date(){
    y=${2}.date
    echo $y
    for (( i=1;i<365*2;i++ )); do
        echo $(date +"%d-%m-%y" -d "+ $i days"):$1 >> $y
        #echo $now
    done
}
#'