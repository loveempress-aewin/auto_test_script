#!/bin/bash

## date : Wed Jan  7 15:56:03 CST 2026
## author : lovequeen
## goal :


#### add some
# if [ -e "./gpio"];then
#     echo "ok have gpio execute"
# else
#     exit 132
# fi
[ -f "./gpio" ] && echo "File exists." || exit 432;

mkdir gpio_love_auto/
love_dir_put=${PWD}/gpio_love_auto/

#### reset my love in data !!!
love_database=${love_dir_put}/gpio_database.csv # w *FILE
love_oppo_data=${love_dir_put}/gpio_database_oppo.csv # w *FILE

# echo "" > ${love_database} --> error --> is will let file first line to space line...
# echo "" > ${love_oppo_data}
if [[ -f ${love_database} ]];then
    rm ${love_database}
fi
if [[ -f ${love_oppo_data} ]];then
    rm ${love_oppo_data}
fi

let love_count=0
# Run the gpio help, filter for the 'Set' lines, and format into a CSV
# Format: Command,Description,Pin,TargetValue
# ./gpio | grep "Set GPO" | while read -r line; do
# ./gpio | grep -E "gpio [0-9]{1,2}[hl]" | while read -r line; do --> error
./gpio | grep -E "[0-9]{1,2}[hl]" | while read -r line; do
    # Example line: "gpio -10h : Set GPO10 high"

    CMD=$(echo $line | awk '{print $2}')    # -10h
    # DESC=$(echo $line | awk '{print $4 $5 $6}') # SetGPO10high
    DESC=$(echo $line | awk '{print  $5 }') # GPO10
    PIN=$(echo $CMD | tr -dc '0-9')         # 10

    # love_count =$love_count +1
    # if [[ ${love_count} == 1 ]];then
    # let love_tem_cmd=${CMD}
    # fi ----> this will put another file...I want clear scriptXD

    printf "$love_counti\n";
    # Determine what the "Software Value" should be
    [[ "$CMD" == *h ]] && VAL=1 || VAL=0

    echo "$CMD,$DESC,$PIN,$VAL" >> ${love_database}
done

#### add opposite version

./gpio | grep -E "[0-9]{1,2}[hl]" | while read -r line; do
    # Example line: "gpio -10h : Set GPO10 high"

    CMD=$(echo $line | awk '{print $2}')    # -10h
    DESC=$(echo $line | awk '{print  $5 }') # GPO10
    PIN=$(echo $CMD | tr -dc '0-9')         # 10

    # Determine what the "Software Value" should be
    [[ "$CMD" == *h ]] && VAL=0 || VAL=1

    echo "$CMD,$DESC,$PIN,$VAL" >> ${love_oppo_data}
done

# ./gpio -r
# GPI 0 : 1
# GPI 1 : 1
# GPI 2 : 1
# GPI 3 : 1
# GPO 10 : 0
# GPO 11 : 0
# GPO 12 : 0
# GPO 13 : 0

echo "Database updated. Current mappings:"
cat gpio_database.csv

# -10h,GPO10,10,1
# -10l,GPO10,10,0
# -11h,GPO11,11,1
# -11l,GPO11,11,0
# -12h,GPO12,12,1
# -12l,GPO12,12,0
# -13h,GPO13,13,1
# -13l,GPO13,13,0
