#!/bin/bash


hotel_range() {
 
cd hotels
echo " "
echo " "
echo "      results"
echo "---------------------"
for files in $(ls *.date);do
    #echo $files
    #grep -n $start $files
    s=$(grep -n $1 $files | cut -d: -f1) 

    #echo

    e=$(grep -n $2 $files | cut -d: -f1)
    flag=0
    #echo $s $e
    for numbers in $(sed -n -e $s,${e}p $files | cut -d: -f2); do
        if (( $numbers == 0 ));then
            let flag=1
            break
        fi
    done
    
    if (( $flag==0 ));then
        #echo ${files:0:8}
        grep name ${files:0:8}.hotel | cut -d: -f2
    fi

done;
echo "---------------------"
echo " "
echo " "
cd ..

}































