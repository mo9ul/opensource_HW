#!/bin/bash
DB=DB.txt
while true; do
  echo "===================="
  echo "1) 팀원 정보 추가"
  echo "2) 팀원과 한 일 기록"
  echo "3) 팀원 검색"
  echo "4) 수행 내용 검색"
  echo "5) 종료"
  echo "===================="
  read -p "번호 입력: " menu

  if [ "$menu" = "1" ]; then
    while true; do
      read -p "팀원 이름: " name
      [ -z "$name" ] || break
    done
    while true; do
      read -p "생일 (예: 2000-01-01): " birth
      [ -z "$birth" ] || break
    done
    while true; do
      read -p "전화번호: " phone
      [ -z "$phone" ] || break
    done
    echo "[INFO] $name,$birth,$phone" >> $DB
    echo "추가 완료"

  elif [ "$menu" = "2" ]; then
    read -p "팀원 이름: " name
    read -p "날짜 (예: 2025-11-09): " date
    read -p "수행 내용: " job
    echo "[TASK] $name,$date,$job" >> $DB
    echo "기록 완료"

  elif [ "$menu" = "3" ]; then
    read -p "검색할 팀원 이름: " name
    grep "^\[INFO\] $name" $DB

  elif [ "$menu" = "4" ]; then
    read -p "검색할 날짜(예: 2025-11-09) 또는 내용: " search
    grep "^\[TASK\].*$search" $DB

  elif [ "$menu" = "5" ]; then
    echo "종료"
    break
  else
    echo "잘못된 입력! 1~5 중에서 골라주세요."
  fi
  echo
  sleep 1
done
