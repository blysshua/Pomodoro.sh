#!/bin/bash

clear
cat ~/Projects/pomodoro/pomo_title.txt

set_intervals() {
  echo "Set study time: (minutes) "
  read study_time
  echo "Set break time: (minutes)"
  read break_time
}

set_repetitions() {
  echo "Set repetitions:"
  read repetitions
}

set_intervals
set_repetitions

for ((i = 1; i <= repetitions; i++)); do
  clear
  echo "Lock-in: Rep $i/$repetitions"
  timer "${study_time}m"
  notify-send "Pomodoro" "Break Time"
  paplay ~/Projects/pomodoro/soft.wav
  clear

  echo "Break: Rep $i/$repetitions"
  timer "${break_time}m"
  notify-send "Pomodoro" "Back to study"
  paplay ~/Projects/pomodoro/soft.wav
  clear
done

echo "Session completed!"
