#!/bin/bash

num1=$1
num2=$2

if [ -z "$num1" ] || [ -z "$num2" ]; then
  echo "사용법: ./ex3-1.sh 숫자1 숫자2"
  exit 1
fi

sum=$((num1 + num2))
diff=$((num1 - num2))
prod=$((num1 * num2))

if [ "$num2" -eq 0 ]; then
  echo "0으로는 나눌 수 없다!"
else
  div=$((num1 / num2))
  echo "나눗셈: $div"
fi

echo "덧셈: $sum"
echo "뺄셈: $diff"
echo "곱셈: $prod"
