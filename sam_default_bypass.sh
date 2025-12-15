#!/bin/bash

####date : Wed Dec 10 15:22:48 CST 2025
####author : lovequeen
#### goal :

love_rule=$#
let love_min=0;
let love_max=0;
love_exe="";
let love_port=1;
L_path=$PWD

if (( $love_rule > 0 ));then
    love_exe=$1;
elif [[ -f ${L_path}/bypass ]];then
    love_exe=${L_path}/bypass
else
    read -p 'PLZ input the name of the executable file : ' love_exe
fi
###dev use var
let love_mylover=4;
if (( $love_rule == 2 ));then
    love_mylover=$2;
fi

read -p "[1/${love_mylover}] Please the min number : " love_min

read -p "[2/${love_mylover}] plz input max number : " love_max

read -p "[3/${love_mylover}] plz input which port(1-4) : " love_port

love_control=""

read -p "[4/${love_mylover}] plz input which set(ee ed dd) : " love_control

####TODO check 4 input if error exit

function because_IDW_use_shit_code(){
    for (( i=${love_min}; i<=${love_max};i++ ));do
        echo "${love_exe} -${love_control} ${love_port} ${i} -u";
        ${love_exe} -${love_control} ${love_port} ${i} -u;
        for (( x=${love_min}; x<=${love_max};x++ ));do
            ${love_exe} -rn ${love_port} ${x};
        done
    done
}
    because_IDW_use_shit_code
