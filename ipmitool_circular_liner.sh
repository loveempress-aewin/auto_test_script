#!/bin/bash
#### aut : lovequeen
#### time : Fri Aug 29 15:41:18 CST 2025
#### goal : loop ipmitool line or circular mode

ipmitool_sel=3630;
paramater_catch=$#;
devlopi_flag=0;
love_check_ipmi_detch=99;
file_name_mode="";

get_policy_mode=$(ipmitool raw 0x32 0x7e);
love_check_ipmi_detch=$?

#### the dir collect data
love_dir_name="love_sel_log/"
mkdir -vp ${love_dir_name}
love_path=${PWD}/${love_dir_name}

# 00h linear sel  01h circular sel
echo "${love_check_ipmi_detch}"
if [[ ${love_check_ipmi_detch} == 1 ]]
then
    echo "ERROR : not catch SEL mode";
fi
#### TODO : detect mode (line or circle)
#/mnt/d/role/john_大神/MegaRAC  SP-X - AMI OEM Commands Specification_20250829.pdf
if [[ ${get_policy_mode} == " 01" ]]
then
    echo "circular";
    file_name_mode="circular";
elif [[ ${get_policy_mode} == " 00" ]]
then
    echo "linear";
    file_name_mode="linear";
else
    echo " WTF??? AMI change it plz check it feedback hex value ≧ ﹏ ≦ ";
    exit 520
fi

# check_function;
check_function(){
    love_check_ipmi_detch=$?
}

ipmitool sel clear
ipmitool sel elist

# echo "${get_policy_mode}"

loop1(){
    for ((i=0; i<10; i++)); do
        echo "loop1";
        ipmitool event 1
    done
    #### save log
    ipmitool sel elist > ${love_path}/0_${file_name_mode}_$(date +%Y.%m.%d_%H.%M).log
}


loop2(){
    for ((i=0;i<${ipmitool_sel};i++));do
        echo "loop2: ${i} / ${ipmitool_sel}";
        ipmitool event 2
    done
}

loop3(){
    for (( i=0;i<5;i++ ));do
        echo "loop3";
        ipmitool event 3
    done
    #### save log
    ipmitool sel elist > ${love_path}/1_${file_name_mode}_$(date +%Y.%m.%d_%H.%M).log
}


loop1
loop2
loop3
# for i in {1..10};
# do
#     echo "loop1 : $i";
#     # ipmitool event 1;
# done
# ipmitool sel elist > sel_$(date +%F_%T)_0.txt
# # for i in {1..${ipmitool_sel}};
# # for i in {1..3630};
# # do
# #     echo "loop2:$i/${ipmitool_sel}";
# #     ipmitool event 2;
# # done

# for i in $(seq 1 ${ipmitool_sel});
# do
#     echo "loop2:$i/${ipmitool_sel}";
# done

# for i in {1..5};
# do
#     echo "loop99 -> $i";
#     # ipmitool event 3;
# done

# ipmitool sel elist > sel_$(date +%F_%T)_1.txt
