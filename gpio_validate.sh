#!/bin/bash
## date : Wed Jan  7 16:57:46 CST 2026
## author : lovequeen
## goal :

# RAW=head -n 1 gpio_database.csv
RAW=$(head -n 1 gpio_database.csv)

CMD=$(echo ${RAW} |awk -F',' '{print $1}')
love_expect=$(echo ${RAW}|awk -F',' '{print $4}')

love_pattern=$(echo ${RAW}|awk -F',' '{print $3}') ##10~13


./gpio ${CMD}

# love_validate= ./gpio -r|grep ${love_pattern}|awk -F': ' '{print $2}' ###-->nil string

# love_validate=$(./gpio -r|grep ${love_pattern}|awk -F': ' '{print $2}')
##  ./gpio -r|grep 10|awk -F': ' '{print $2}'|cat -A
##---output-->1      $
## + love_validate='1     `
## + love_expect=1

love_validate=$(./gpio -r|grep ${love_pattern}|awk -F': ' '{print $2}'|sed 's#[[:space:]]*$##')
### fix output bug....
# [[ ${love_expect} == ${love_validate} ]] && echo "same" || echo "oppo"
if [[ ${love_expect} == ${love_validate} ]] ;then
    cp ./gpio_database.csv ./match_p.csv
else
    cp ./gpio_database_oppo.csv ./match_p.csv
fi
