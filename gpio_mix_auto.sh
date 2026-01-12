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

# bash gpio_data.sh
bash $love_env/gpio_data.sh

# bash ./gpio_validate.sh
bash ${love_env}/gpio_validate.sh

bash ${love_env}/gpio_execute.sh
