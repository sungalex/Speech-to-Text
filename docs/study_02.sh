#!/bin/bash 

echo "# for 반복문 # "
for foo in bar fud coke; do 
    echo "$foo"
done

for foo in "bar fud coke"; do 
    echo "$foo"
done
echo "===="
echo ""

echo "# for 파일디렉토리 # "
for file in `ls *.sh`; do
    echo "$file"
done
echo "===="
echo ""

echo "# while 예제 # "
foo=1
while [ $foo -le 5 ]; do
    echo "$foo"
    echo $foo+1
    foo=$(($foo+1))
done
echo "===="
echo ""

data=/export/a15/vpanayotov/data
echo "$data"
