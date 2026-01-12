#!/bin/bash
##date		: Fri Jan  9 09:28:08 CST 2026
##author	: lovequeen

if [[ -x ./gpio ]]; then
    love_exe_gpio=$(realpath ./gpio)
fi

#### { ----- reset log file part -----
current_love=$PWD
love_dir_put=${PWD}/gpio_love_auto
love_gpio_log_file="${love_dir_put}/gpio_auto.log"
love_pass_fail_log="${love_dir_put}/gpio_pass_file.log"
echo "" > ${love_gpio_log_file} # W *FILE
echo "" > ${love_pass_fail_log} # W *FILE
####   ----- reset log file part ----- }


date > ${love_gpio_log_file} #W *FILE
${love_exe_gpio} -r >> ${love_gpio_log_file} #W *FILE

cat ${love_dir_put}/match_p.csv | while read -r line;do
    love_cmd=$(echo $line|awk -F',' '{print $1}')
    love_expected=$(echo $line|awk -F',' '{print $4}')
    love_pattern=$(echo $line|awk -F ',' '{print $3}')
    # execute cmd then compare it
    $love_exe_gpio $love_cmd
    echo "$love_exe_gpio $love_cmd" >> ${love_gpio_log_file} #W *FILE
    $love_exe_gpio -r >> ${love_gpio_log_file} #W *FILE

    printf "$love_exe_gpio $love_cmd" >> ${love_pass_fail_log} #W *FILE

    # compare
    love_validate=$(./gpio -r|grep ${love_pattern}|awk -F': ' '{print $2}'|sed 's#[[:space:]]*$##')
    # ${love_validate} >> ${love_gpio_log_file} --WTF --

    if [[ ${love_expected} == ${love_validate} ]] ;then
        # cp ./gpio_database.csv ./match_p.csv
        printf " pass \n" >> ${love_pass_fail_log} # W *FILE
    else
        # cp ./gpio_database_oppo.csv ./match_p.csv
        printf " FAILED \n" >> ${love_pass_fail_log} # W *FILE
    fi
done
