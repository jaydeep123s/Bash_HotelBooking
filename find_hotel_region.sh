#!/bin/bash

hotel_region(){
    #echo $1
    echo " "
    echo "    Results :
--------------------"
    for file in $( grep -i location hotels/*.hotel | grep -i $1 | cut -d: -f1 | cut -d/ -f2);do 
        cut -d: -f1-2 hotels/$file | grep name | cut -d: -f2
    done
    echo "--------------------"
    echo " "
}


#cut -d: -f1-2 hotels/* | grep name | cut -d: -f2
#grep orissa hotels/*
#grep orissa hotels/* | cut -d: -f1 | cut -d/ -f2