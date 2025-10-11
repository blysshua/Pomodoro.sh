#!/bin/bash

clear

study_time="${1:-45}"
break_time="${2:-10}"
repetitions="${3:-3}"

for ((i = 1; i <= repetitions; i++)); do
  clear
  echo "Lock-in: Rep $i/$repetitions"
  timer "${study_time}m"
  notify-send "Pomodoro" "Break Time"
  paplay ~/Music/soft.wav
  clear

  echo "Break: Rep $i/$repetitions"
  timer "${break_time}m"
  notify-send "Pomodoro" "Back to study"
  paplay ~/Music/soft.wav
  clear
done

echo "Session completed!"
