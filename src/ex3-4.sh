#!/bin/bash
scores=()
while true; do
  echo "===================="
  echo "1) 과목 성적 추가"
  echo "2) 입력된 모든 점수 보기"
  echo "3) 평균 점수 확인"
  echo "4) 평균 등급(GPA) 변환"
  echo "5) 종료"
  echo "===================="
  read -p '번호를 입력하세요: ' choice
  if [ "$choice" -eq 1 ]; then
    read -p "점수(0~100)를 입력: " s
    if [[ "$s" =~ ^[0-9]+$ ]] && [ "$s" -ge 0 ] && [ "$s" -le 100 ]; then
      scores+=("$s")
      echo "성적이 추가됐습니다."
    else
      echo "잘못된 점수!"
    fi
  elif [ "$choice" -eq 2 ]; then
    echo "입력된 점수: ${scores[@]}"
  elif [ "$choice" -eq 3 ]; then
    if [ ${#scores[@]} -eq 0 ]; then
      echo "점수가 없음!"
      continue
    fi
    sum=0
    for s in "${scores[@]}"; do
      sum=$((sum+s))
    done
    avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
    echo "평균 점수: $avg"
  elif [ "$choice" -eq 4 ]; then
    if [ ${#scores[@]} -eq 0 ]; then
      echo "점수가 없음!"
      continue
    fi
    sum=0
    for s in "${scores[@]}"; do
      sum=$((sum+s))
    done
    avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
    if (( $(echo "$avg >= 90" | bc) )); then
      gpa="A"
    else
      gpa="B"
    fi
    echo "평균 등급(GPA): $gpa"
  elif [ "$choice" -eq 5 ]; then
    echo "프로그램 종료"
    break
  else
    echo "잘못된 입력! 1-5 중에서 골라야 함!"
  fi
  echo
done

