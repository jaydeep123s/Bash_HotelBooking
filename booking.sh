#!/bin/bash

# implement a check where starting date has to be after the current date
book(){
echo -n "Enter your email id: "
read email
#echo "users/$email"
if [ -f "users/$email" ];then
    echo "Account found..."
    echo " "
    echo -n "Enter the hotel name: "
    read hotel
    hotel=name:$hotel
    echo $hotel
    hotelid=$(grep -i "$hotel" hotels/*.hotel | cut -d/ -f2 | cut -d: -f1 | cut -d. -f1)
    echo $hotelid

    if [ -f "hotels/$hotelid.hotel" ];then
        echo "Hotel found"
        echo " "
        echo "date format dd-mm-yy"
        echo -n "Enter the starting date: "
        read start
        echo -n "Enter the ending date: "
        read end
        echo -n "Enter the number of rooms required: "
        read room

        echo " "
        echo "Checking for availibility.."
        cd hotels
        s=$(grep -n $start "$hotelid.date" | cut -d: -f1)

        #echo

        e=$(grep -n $end "$hotelid.date" | cut -d: -f1)
        flag=0
        #echo $s $e

        for numbers in $(sed -n -e "$s","${e}p" $hotelid.date | cut -d: -f2); do
            #echo $(( numbers=numbers-room ))
            numbers=$(( numbers-room ))
            if (( numbers<0 ));then
                let flag=1
                break;
            fi
        done

        if (( flag==1 ));then
            echo "Rooms not available"
            echo " "
        else
            echo "Rooms available...."
            echo " "
            #grep -n "10-05-19" 9d794b89.date | cut -d: -f1
            #26
            #sed -i "5s/19-04-19:50/19-04-19:41/" 9d794b89.date | head

            # updating the room numbers
            for (( i=s;i<=e;i++ ));do
                date=$(sed "${i}q;d" "$hotelid.date" | cut -d: -f1)
                #echo $date
                avrooms=$(sed "${i}q;d" "$hotelid.date"  | cut -d: -f2)
                #echo $avrooms
                nrooms=$(( avrooms-room ))
                #echo "$date:$nrooms"
                sed -i "${i}s/$date:$avrooms/$date:$nrooms/" "$hotelid.date"
            done

            #creating the user booking data at hotels end

            echo "You can add upto $(( room*3 )) people"
            str=''
            for (( i=0;i<room*3;i++ ));do
                echo -n "Do you want to enter a name?(y/n) "
                read ans
                if [ $ans == "y" ];then
                    read name
                    str="$name,$str"
                else
                    break
                fi
            done






            if [ -f "$hotelid.bookings" ];then
                id=$(grep id ../users/"$email" | cut -d: -f2)
                name=$(grep name ../users/"$email" | cut -d: -f2)
                address=$(grep address ../users/"$email" | cut -d: -f2)
                phone=$(grep phone ../users/"$email" | cut -d: -f2)
                echo "$id:$name:$email:$address:$phone:$room:$start:$end:$str" >> "$hotelid.bookings"
            else
                echo "id:name:email:address:phone:rooms:start:end:others" >> "$hotelid.bookings"
                id=$(grep id ../users/"$email" | cut -d: -f2)
                name=$(grep name ../users/"$email" | cut -d: -f2)
                address=$(grep address ../users/"$email" | cut -d: -f2)
                phone=$(grep phone ../users/"$email" | cut -d: -f2)
                echo "$id:$name:$email:$address:$phone:$room:$start:$end:$str" >> "$hotelid.bookings"
            fi
            #storing the booking id at user's end

            echo "booking done..."
            echo " "
            echo " "
        fi
        cd ..
    else
        echo "hotel doesnt exists"
        echo " "
        echo " "
    fi

else
    echo "you are not registered"
    echo " "
    echo " "
fi
}
