#!/bin/bash
##author : lovequeen
##date : Mon Oct 27 10:01:50 CST 2025
##goal : mac address
##First, use ipmitool to get the original MAC address.
##Next, change the MAC address
##Finally, revert the MAC address back to the original
##.__
##|  |   _______  __ ____   _____   ____
##|  |  /  _ \  \/ // __ \ /     \_/ __ \
##|  |_(  <_> )   /\  ___/|  Y Y  \  ___/
##|____/\____/ \_/  \___  >__|_|  /\___  >
##                      \/      \/     \/


printf "need to open the BMC mac address triger"
ipmitool raw 0x0c 0x01 0x01 0xc2 #### open the BMC mac address triger
love_log_file="mac_address.txt"

date>${love_log_file};
printf "first mac :" >>${love_log_file};
ipmitool lan print 1|grep -i 'mac address' >> ${love_log_file};

#### extract the mac address using cut or awk
love_only=$(cat ${love_log_file}| awk -F ': ' '{print $2}')
printf "this is 1 step :\n%s \n" ${love_only}
love_formatted=$(echo "$love_only" | awk -F: '{for(i=1;i<=NF;i++) printf "0x%s ", $i}');

echo "" >> ${love_log_file};


gpt(){
input="MAC Address             : 00:0d:48:56:6f:66"

# Extract the MAC address using cut or awk
mac=$(echo "$input" | awk -F': ' '{print $2}' | tr -d '\r')

# Convert to desired format
formatted=$(echo "$mac" | awk -F: '{for(i=1;i<=NF;i++) printf "0x%s ", $i}')
echo "$formatted"
}
