#!/bin/bash
file=$(pwd)/users
#echo $file
if [ -d "$file" ]; then
    echo ""
else
    # echo "Does not exist"
    mkdir users
fi

function create_user(){
    cd users
    echo -n "Enter name : "
    read name
    echo " "
    echo -n "Enter address : "
    read address
    echo " "
    echo -n "Enter phone number(10 digit) : "
    read number
    echo " "
    echo -n "Enter email address : "
    read email

    file=$(pwd)/$email
    #echo $file
    if [ -f "$file" ]; then
        echo "User already exists !!"
    else
        echo "name:$name" >> $email
        echo "address:$address" >> $email
        echo "phone:$number" >> $email
        str=$(echo $email | md5sum)
        echo "id:${str:2:8}" >> $email
        echo " "
        
        echo "User details :"
        echo " "
        echo "............................"
        echo " "
        cat $email
        echo " "
        echo "............................"

        echo " "
        echo " "
        echo "User added ..."
        echo " "
        echo " "
    fi

    cd ..
}