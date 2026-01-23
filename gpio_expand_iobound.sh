#!/bin/bash
#### date	: Wed Jan 21 14:16:11 CST 2026
#### author	: lovequeen
#### goal	: "Manual input for pairing GPIO input and output"

echo 'Manual input for pairing GPIO input and output'

current_love=$PWD
love_dir_put=${PWD}/gpio_love_auto/
if [[ ! -d ${love_dir_put} ]];then
    mkdir -v gpio_love_auto/
fi

love_io_file=${love_dir_put}/bound_io.csv

if [[ -f ${love_io_file} ]];then
    rm ${love_io_file}
fi

let love_array = 4
printf "How many groups of GPIO are there (usually 4 groups)[default set 4]?\n"
read -p "intput ---->" love_array

for ((i=1;i<=${love_array} ; i++ ));do
    # printf "love + ${i}\n"
    # printf "[${i}] intput "
    read -p "${i} input" tem_input

    read -p "${i} : output" tem_output
    printf "${tem_input},${tem_output}\n" >> ${love_io_file}
done
