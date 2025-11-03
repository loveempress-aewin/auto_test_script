#!/bin/bash
#### auto : lovequeen
#### date : Tue Sep  2 10:49:47 CST 2025
#### mode : Thu Sep 25 10:22:45 CST 2025
#### goal : for lose 1 fan and auto log
#### use  : only use source way !!! didn't use bash or excute way!!!
love_interval=10;
love_count=10;
##todo input interval
##todo input how many count
##todo save -> log file
shopt -s expand_aliases

love_file=sdr_$(date +%Y.%m.%d_%H.%M).log

is_number(){
    #use a regular expression to check if the input contains only digits
    [[ "$1" =~ [0-9]+$ ]]
    # [[ "$1" =~ ^[[:digit:]]+$ ]] || exit 1
    # Here I'm sure that number is a valid number in the range 0..9999
}

# Prompt the user for input
# while true; do
#     read -p "Please enter a number: " input
#     # Validate the input
#     if is_number "$input"; then
#         echo "You entered a valid number: $input"
#         break
#     else
#         echo "Invalid input. Please enter a valid number."
#     fi
# done
alias g="grep --color=auto"
alias gg="g -iE"

# while true; do
#     read -p "please enter interval time (default 10) " love_interval
#     if is_number "$love_interval"; then
#         echo "you entered a interval number: $love_interval"
#         break
#     else
#         echo " invalid input . Please enter a valid number."
#     fi
# done

read -p "[1/2] please enter total interval : " love_interval
if is_number "$love_interval";then
    echo "you enter interval : $love_interval ";
fi

read -p "[2/2] please enter total count : " love_count
if is_number "$love_count";then
    echo "you enter count : $love_count";
else
    love_count=10;
    echo "count will default : $love_count";
fi

# echo " count [$love_count]  sleep :[$love_interval]";
echo '================================================================' > ${love_file};
for (( i=0; i<${love_count};i++ ));do
    date >> ${love_file};
    ipmitool sdr |g -v ns |gg "fan|temp" >>${love_file};
    love_remainder=$(($i % 4))
    case $love_remainder in
        1)
            echo "雷開車yang的ichiro  ≧ ﹏ ≦"
            ;;
        2)
            echo "terry love josh  (❁´◡\`❁)"  #### error = =
            ;;
        3)
            echo "ichiro love yang ╰(*°▽°*)╯"
            ;;
        *)
            echo "brian_song love alber o(*^▽^*)┛"
            ;;
    esac
            echo " love ------> [${i} / ${love_count}]";
    sleep $love_interval;
done
