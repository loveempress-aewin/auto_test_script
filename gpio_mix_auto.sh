#!/bin/bash
####date	: Fri Jan  9 14:31:50 CST 2026
####author	: lovequeen
####goal	: because I split 3 file
# After executing this,
#it becomes an integrated simplified command
#       ,--,
#    ,---.'|       ,----..
#    |   | :      /   /   \                  ,---,.
#    :   : |     /   .     :        ,---.  ,'  .' |
#    |   ' :    .   /   ;.  \      /__./|,---.'   |
#    ;   ; '   .   ;   /  ` ; ,---.;  ; ||   |   .'
#    '   | |__ ;   |  ; \ ; |/___/ \  | |:   :  |-,
#    |   | :.'||   :  | ; | '\   ;  \ ' |:   |  ;/|
#    '   :    ;.   |  ' ' ' : \   \  \: ||   :   .'
#    |   |  ./ '   ;  \; /  |  ;   \  ' .|   |  |-,
#    ;   : ;    \   \  ',  /    \   \   ''   :  ;/|
#    |   ,/      ;   :    /      \   `  ;|   |    \
#    '---'        \   \ .'        :   \ ||   :   .'
#                  `---`           '---" |   | ,'
#                                        `----'
#### 本宮在 ab裡面跌倒 真的是 吃一塹，長一智
####==================================================================
# bash ./gpio_data
full_path=$(which gpio_mix_auto.sh )
love_env="${full_path%/*}"

read -p "u need input GPI GPO mapping?( yes or no )" love_expand_iobound
if [[ "$love_expand_iobound" =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # echo "Accepted: $love_expand_iobound"
    bash ${love_env}/gpio_expand_iobound.sh
fi

# bash gpio_data.sh
bash $love_env/gpio_data.sh

# bash ./gpio_validate.sh
bash ${love_env}/gpio_validate.sh

bash ${love_env}/gpio_execute.sh

#### bash expand part

if [[ -f $PWD/gpio_love_auto/bound_io.csv ]];then
    bash ${love_env}/gpio_expand_execute.sh;
else
    echo "not have bound_io.csv "
fi
