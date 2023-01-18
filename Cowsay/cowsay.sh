#!/bin/bash
RANGE=7
LOC=~/Documents/TerminalBin/MyShell/Cowsay/
number=$RANDOM
let "number %= $RANGE"

case $number in
    0)
        cow="My_Name1"
    ;;
    1)
        cow="My_Name2"
    ;;
    2)
        cow="My_Name3"
    ;;
    3)
        cow="My_Name4"
    ;;
    4)
        cow="My_Name5"
    ;;
    5)
        cow="My_Name6"
    ;;
    6)
        cow="My_Name7"
    ;;
esac

cat $LOC/$cow | lolcat
echo "I ❤ DevOps.....🔥🔥🔥🔥🔥🔥" | lolcat -a -d 30
echo ""
