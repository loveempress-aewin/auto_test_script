#!/bin/bash

####date : Wed Dec 10 15:22:48 CST 2025
####author : lovequeen
#### goal : ed -> ee -> dd

love_rule=$#
let love_min=0;
let love_max=0;
love_exe="";
let love_port=1;
L_path=$PWD;

if (( $love_rule > 0 ));then
    love_exe=$1;
elif [[ -f ${L_path}/bypass ]];then
    love_exe=${L_path}/bypass
else
    read -p 'PLZ input the name of the executable file : ' love_exe
fi
###dev use var
let love_mylover=3;
if (( $love_rule == 2 ));then
    love_mylover=$2;
fi
####TODO +add check special port is ed (because need to loop 3)

printf "this is bypass -t\n";

read -p "[1/${love_mylover}] Please the min number : " love_min

read -p "[2/${love_mylover}] plz input max number : " love_max

read -p "[3/${love_mylover}] plz input which port(1-4) : " love_port

let love_bt=3; #### time wdt
for (( i=${love_min}; i<=${love_max};i++ ));do
    ${love_exe} -r ${love_port} ${i};
done

function IDW_use_shit_code(){
    for (( i=${love_min}; i<=${love_max};i++ ));do
        echo "${love_exe} -t ${love_port} ${i} -nu ${love_bt}";
        ${love_exe} -t ${love_port} ${i} -nu ${love_bt};
        # sleep ${love_bt}+1;    # FIX: Use arithmetic expansion $(( )) for calculation
        # for (( b=${love_min}; b<=${love_max};b++ ));do
        #     ${love_exe} -r ${love_port} ${b};
        # done
        ${love_exe} -r ${love_port} ${i};
        printf "\n================ time out ================\n"
        sleep $((love_bt +1));
        for (( a=${love_min}; a<=${love_max};a++ ));do
            ${love_exe} -r ${love_port} ${a};
        done
    done
}
IDW_use_shit_code
