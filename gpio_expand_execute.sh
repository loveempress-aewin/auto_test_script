#!/bin/bash
##date		: Fri Jan  9 09:28:08 CST 2026
##author	: lovequeen
#### inheirent form gpio_execute.sh
#### if 74 with 70
####    expect   validate


if [[ -x ./gpio ]]; then
    love_exe_gpio=$(realpath ./gpio)
fi

#### { ----- reset log file part -----
current_love=$PWD
love_dir_put=${PWD}/gpio_love_auto
# love_gpio_log_file="${love_dir_put}/gpio_auto.log"
love_pass_fail_log="${love_dir_put}/gpio_pass_file_ex.log"
love_all_par_csv=${love_dir_put}/match_p.csv
# echo "" > ${love_gpio_log_file} # W *FILE
# echo "" > ${love_pass_fail_log} # W *FILE
####   ----- reset log file part ----- }
love_io_file=${love_dir_put}/bound_io.csv
# if [[ -f ${love_io_file} ]];then
#     # echo "TODO"
#     rm -v ${love_io_file}
# fi
love_all_log=${love_dir_put}/gpio_auto_exp_log
if [[ -f ${love_all_log} ]];then
    rm ${love_all_log}
fi
if [[ -f ${love_pass_fail_log} ]];then
    rm ${love_pass_fail_log}
fi

use_expand_get_expand(){
    cat ${love_io_file} |while read -r line;do #### this one only correct gpio
    love_pattern=$(echo $line|awk -F',' '{print $1}') ## same as 74
    love_pattern_expand=$(echo $line|awk -F',' '{print $2}') ##  70
    #### use another condition to like pip
    cat ${love_all_par_csv} |while read -r line;do
    love_cmd=$(echo $line|awk -F',' '{print $1}')
    if echo "${love_cmd}" | grep -q "${love_pattern}";then
        love_expected=$(echo $line|awk -F',' '{print $4}')
        # echo "have    [${love_cmd}]";
        # echo "   exp:${love_expected}"
        #### execute gpio
        echo "${love_exe_gpio} ${love_cmd}" >> ${love_all_log}
        $love_exe_gpio $love_cmd
        $love_exe_gpio -r >>${love_all_log}
        # echo "$love_exe_gpio $love_cmd" >> ${love_gpio_log_file} #W *FILE
        love_validate=$(./gpio -r|grep ${love_pattern_expand}|awk -F': ' '{print $2}'|sed 's#[[:space:]]*$##')
        printf "$love_exe_gpio $love_cmd" >> ${love_pass_fail_log} #W *FILE
        if [[ ${love_expected} == ${love_validate} ]] ;then
            # cp ./gpio_database.csv ./match_p.csv
            printf " pass \n" >> ${love_pass_fail_log} # W *FILE
        else
            # cp ./gpio_database_oppo.csv ./match_p.csv
            printf " FAILED \n" >> ${love_pass_fail_log} # W *FILE
        fi
    # else
    #     echo "----------NO:[${love_cmd}]"
    fi
done
done
}

use_expand_get_expand;
