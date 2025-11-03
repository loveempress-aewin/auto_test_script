#!/bin/bash

#### auto : lovequeen
#### date : Wed Sep  3 13:59:34 CST 2025

love_me=$#;
# printf "%d \n" $love_me;
love_string="$1";
# printf "%s \n" $love_string;

have_par(){
    printf "The first 10 lines \n";
    # head -n 10 $1; --> error
    head -n 10 $love_string;
    printf "\n=====================================================\n";
    printf "The last lines \n";
    tail -n 10 $love_string;
}
no_par(){
    printf "omgmomg"
}
if (( "$love_me" == 0 ));then
    no_par;
else
    have_par;
fi
