#!/bin/bash

## auto : lovequeen
## date : Wed Sep 17 10:02:16 CST 2025
## goal :

let love_speed=0;
let love_fir=0;
let love_max=0;
let love_sleep=0;

let love_rule=$#;
if (( $love_rule > 0 ));then
    love_exe=$1;
else
    read -p "Please input the name of the executable file : " love_exe
fi

printf "the exe file [%s] \n" $love_exe

read -p "[1/4] Please input the number (start) : " love_fir

read -p "[2/4] Plearse input the number (max) : " love_max

read -p "[3/4] Please input the speed (0~255) : " love_speed

read -p "[4/4] Please input the interval time : " love_sleep

for (( i=${love_fir}; i <= ${love_max}; i++ ));do
    ${love_exe} -s ${i} ${love_speed}
    sleep ${love_sleep};
done
