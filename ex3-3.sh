#!/bin/bash
scores=()
while [ ${#scores[@]} -lt 2 ]; do
  read -p "점수를 입력하세요 (0~100): " s
  if [[ "$s" =~ ^[0-9]+$ ]] && [ "$s" -ge 0 ] && [ "$s" -le 100 ]; then
    scores+=("$s")
  else
    echo "잘못된 입력, 0~100 사이 정수만!"
  fi
done
while true; do
  read -p "다른 점수를 입력하려면 입력, 끝내려면 엔터: " s
  [ -z "$s" ] && break
  if [[ "$s" =~ ^[0-9]+$ ]] && [ "$s" -ge 0 ] && [ "$s" -le 100 ]; then
    scores+=("$s")
  else
    echo "잘못된 입력, 0~100 사이 정수만!"
  fi
done
grades=()
for s in "${scores[@]}"; do
  if [ "$s" -ge 90 ]; then
    g="A"
  else
    g="B"
  fi
  grades+=("$g")
  echo "점수: $s → 등급: $g"
done
A_count=0
for g in "${grades[@]}"; do
  [ "$g" = "A" ] && ((A_count++))
done
len=${#grades[@]}
if [ "$A_count" -ge $((len/2+len%2)) ]; then
  avg_grade="A"
else
  avg_grade="B"
fi
echo "평균 등급: $avg_grade"

