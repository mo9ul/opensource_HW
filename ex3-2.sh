#!/bin/bash

numbers=()

while [ ${#numbers[@]} -lt 2 ]; do
  read -p "x 값을 입력하세요: " input
  numbers+=("$input")
done

while true; do
  read -p "추가 x 값을 입력하려면 그냥 입력, 끝내려면 엔터: " input
  if [ -z "$input" ]; then
    break
  fi
  numbers+=("$input")
done

for x in "${numbers[@]}"; do
    if [[ ! "$x" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "'${x}'는 숫자가 아니어서 건너뜀"
    continue
  fi
  y=$(echo "scale=6; 0.5 * ($x * $x)" | bc -l)
  echo "x=$x -> y=$y"
done
