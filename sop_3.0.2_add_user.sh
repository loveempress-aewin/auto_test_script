#!/bin/bash
## date : Tue Nov  4 13:59:47 CST 2025
## author : lovequeen
## ref --> sop
## goal:
## 單純不想浪費時間=3= 所以想辦法順便把 auto來寫出來==
####------------------------------------------------------------------
add_user_log="sop_3.0.2_add_user.log"

date > ${add_user_log}
ipmitool user list 1 >> ${add_user_log}

#### just add \n
echo -e \
"\n================================================================\n"\
>> ${add_user_log}

ipmitool user set name 8 test
#### if test it need to look exe it and then --> then test only exe

ipmitool user list 1 >> ${add_user_log}
