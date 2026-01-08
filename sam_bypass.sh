#!/bin/bash

####date : Mon Nov 24 11:28:48 CST 2025
####author : lovequeen
#### goal : loop look all bypass (because need input always ==)

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

for arg in "$@";do
    case $arg in
        -dev|-love|--love)
            printf "\n==== love_exe : ${love_exe} ==== \n";
            return 0;
            ;;
        *)
            ;;
    esac
done

read -p "[1/${love_mylover}] Please the min number : " love_min

read -p "[2/${love_mylover}] plz input max number : " love_max

read -p "[3/${love_mylover}] plz input which port(1-4) : " love_port

love_control="ee"

read -p "[4/${love_mylover}] plz input which set(ee ed dd) : " love_control

####TODO add sleep (if faster ...maybe not change it)


for (( i=${love_min}; i<=${love_max};i++ ));do
    echo "${love_exe} -${love_control} ${love_port} ${i} -nu";
    ${love_exe} -${love_control} ${love_port} ${i} -nu;
    sleep 1;
    # ${love_exe} -r ${love_port} ${interval_count_ipmitool_sdr.sh}
    for (( a=${love_min}; a<=${love_max};a++ ));do
        ${love_exe} -r ${love_port} ${a};
    done
done
