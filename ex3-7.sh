#!/bin/bash
while true; do
  echo "===================="
  echo "1) 사용자 정보"
  echo "2) GPU/CPU 사용률"
  echo "3) 메모리 사용량"
  echo "4) 디스크 사용량"
  echo "5) 종료"
  echo "===================="
  read -p "번호 입력: " choice

  if [ "$choice" == "1" ]; then
    who
  elif [ "$choice" == "2" ]; then
    if command -v nvidia-smi &> /dev/null; then
      nvidia-smi
    else
      top -l 1 | grep "CPU"
    fi
  elif [ "$choice" == "3" ]; then
    if command -v free &> /dev/null; then
      free -h
    else
      top -l 1 | grep PhysMem
    fi
  elif [ "$choice" == "4" ]; then
    df -h
  elif [ "$choice" == "5" ]; then
    echo "프로그램 종료"
    break
  else
    echo "잘못된 선택입니다. 1~5 중 입력하세요."
  fi
  echo
  sleep 1
done

