#!/bin/bash

## auto : lovequee
## date : Tue Sep 16 14:24:56 CST 2025
## goal : one time chang one

let love_fir=0;
let love_id=0;
love_exe="";

let love_rule=$#;
if (( $love_rule > 0 ));then
    love_exe=$1;
else
read -p "Please input the name of the executable file : " love_exe
fi

printf "the exe file [%s] \n" $love_exe

read -p "[1/4] Please input the number (start) : " love_fir

read -p "[2/4] Please input the number (max) : " love_id

read -p "[3/4] Please input high or low(h/l) : " love_hl

read -p "[4/4] Please input interval time : " love_sleep

for (( i=${love_fir}; i<= ${love_id} ; i++ ));do
    #### ./gpio -S0h
    # ${love_exe} -S${i}${love_hl};
    #### ./gpio -0h  --> 1948
    ${love_exe} -${i}${love_hl};
    sleep ${love_sleep};
    ${love_exe} -r;
done
