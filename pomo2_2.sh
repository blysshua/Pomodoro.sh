#!/bin/bash

clear
cat ~/Projects/pomodoro/pomo.txt

study_time="${1:-45}"
break_time="${2:-10}"
repetitions="${3:-3}"

for ((i = 1; i <= repetitions; i++)); do
  clear
  cat ~/Projects/pomodoro/pomo.txt
  echo "Lock-in: Rep $i/$repetitions"
  echo ""
  timer "${study_time}m"
  notify-send "Break Time" "Pomodoro"
  canberra-gtk-play -i window-attention
#  paplay ~/Music/soft.wav
  clear
  cat ~/Projects/pomodoro/pomo.txt


  echo "Break: Rep $i/$repetitions"
  echo ""
  timer "${break_time}m"
  notify-send "Lock in" "Pomodoro"
  canberra-gtk-play -i window-attention
#  paplay ~/Music/soft.wav
  clear
done


cat ~/Projects/pomodoro/pomo.txt

# echo "              Session completed!"

echo "   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo -e "               \e[1mSession Summary:\e[0m             "
echo "      Time locked in: ......... $((study_time * repetitions)) mins        "
echo "      Time on break: .......... $((break_time * repetitions)) mins         "
echo "      Intervals ............... $((repetitions))"
echo ""
echo "      Total Session Time: ..... $(echo -e '\e[1m'$(((study_time + break_time) * repetitions))) mins   "
echo "   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛" 
echo ""
