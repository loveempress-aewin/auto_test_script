#!/bin/bash

## auto : lovequeen
## time : Mon Sep 15 14:28:18 CST 2025
## goal :

love_rule=$#
let love_object=0;
let love_sleep=0;
love_exe="";
let love_min=0;

if(( $love_rule > 0 ));then
    # love_exe=$#
    love_exe=$1;
    # echo "ok";
else
    read -p 'please input the name of the executable file : ' love_exe
fi


# printf "please input the name of the executable file. : "

read -p '[1/4] Please the first number : ' love_min

read -p '[2/4] Please enter the device ID (usually sequential) maximum value : ' love_object

read -p "[3/4] Please enter the interval time : " love_sleep

read -p "[4/4] Please enter open or close (e/d) : " love_light

# printf " exe file [%s] \n id [%d] \n sleep [%d] \n" love_exe love_object love_sleep
printf " exe file [%s] \n id [%d] \n sleep [%d] \n\n" $love_exe $love_object $love_sleep

for (( i=${love_min};i<=${love_object};i++ ));do
    ${love_exe} -${i}${love_light};
    sleep ${love_sleep};
done
