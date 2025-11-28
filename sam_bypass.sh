#!/bin/bash

####date : Mon Nov 24 11:28:48 CST 2025
####author : lovequeen
#### goal : loop look all bypass (because need input always ==)

love_rule=$#
let love_min=0;
let love_max=0;
love_exe="";
let love_port=1;

if (( $love_rule > 0 ));then
    love_exe=$1;
else
    read -p 'PLZ input the name of the executable file : ' love_exe
fi
###dev use var
let love_mylover=1;
if (( $love_rule == 2 ));then
    love_mylover=$2;
fi

read -p '[1/${love_mylover}] Please the min number : ' love_min

read -p '[2/${love_mylover}] plz input max number : ' love_max

read -p '[3/${love_mylover}] plz input which port(1-4) : ' love_port

read -p '[4/${love_mylover}] plz input which set(ee ed dd)' love_control

love_control='ee'

for (( i=${love_min}; i<=${love_max};i++ ));do
    echo "${love_exe} -${love_control} ${love_port} ${i}";
    ${love_exe} -r ${love_port} ${i};
done
