#!/bin/bash
clear
echo "
            ===============================================
            +                                             +
            +        WELCOME TO THE TRIP ADVISOR          +
            +                                             +
            ===============================================
"
echo "  
        options - To see list 
        exit - To close Trip Advisor
"


. user.sh
. find_hotel_region.sh
. find_hotel_range.sh
. booking.sh
stop=0


while (( !stop ))
do
    echo -n "Input: "
    read var
    case $var in
      options)
        clear
        echo "
                ===============================================
                +                                             +
                +        WELCOME TO THE TRIP ADVISOR          +
                +                                             +
                ===============================================
"
            echo "

        1. Add a new person
        2. View list of hotels in a particular location
        3. View list of hotels according to check in and check out dates
        4. Add the no. of adults and children for booking 
    "
            ;;       
        1)
            clear
            echo "
            ----------------------
            ||                  ||
            ||  CREATE ACCOUNT  ||
            ||                  ||
            ----------------------
            "
            create_user
            ;;
        2)
            clear 
            echo "
            ----------------------------
            ||                        ||
            ||  REGION WISE CHECKING  ||
            ||                        ||
            ----------------------------
            "

            
            echo -n "Enter the region: "
            read region
            hotel_region $region
            ;;
        3)
            clear
            echo "
            ----------------------------
            ||                        ||
            ||   HOTEL AVAILABILITY   ||
            ||                        ||
            ----------------------------
            "

            echo "Date format : %d-%m-%y"

            echo -n "Enter the start date (dd-mm-yy):  "

            read start

            echo -n "Enter the end date   (dd-mm-yy):  "
            read end


            hotel_range $start $end
            ;;
        4)
            clear
            echo "
            ----------------------------
            ||                        ||
            ||        BOOKING         ||
            ||                        ||
            ----------------------------
            "
            book
            ;;
        exit)
            clear
            echo " "
            echo " "
            echo " "
            echo "
 ______  __ __   ____  ____   __  _      __ __   ___   __ __  __  __ 
|      ||  |  | /    ||    \ |  |/ ]    |  |  | /   \ |  |  ||  ||  |
|      ||  |  ||  o  ||  _  ||  ' /     |  |  ||     ||  |  ||  ||  |
|_|  |_||  _  ||     ||  |  ||    \     |  ~  ||  O  ||  |  ||__||__|
  |  |  |  |  ||  _  ||  |  ||     |    |___, ||     ||  :  | __  __ 
  |  |  |  |  ||  |  ||  |  ||  .  |    |     ||     ||     ||  ||  |
  |__|  |__|__||__|__||__|__||__|\_|    |____/  \___/  \__,_||__||__|
                                                                     
            "
            let stop=1
            ;;
        *)
            echo "Sorry, Option unavailable"
            ;;
    esac
done 
