
echo "# 변수 정의 및 출력 # "
var="hello"
echo $var
echo "===="
echo ""

echo "# Argument 파라미터 확인 # "
echo "argument parameters : $@"
echo "0-arg: $0"
echo "1-arg: $1"
echo "2-arg: $2"
echo "3-arg: $3"
echo "4-arg: $4"
echo "===="
echo ""

echo "# 파일존재 유무 확인 # "
if [ -f "test.py" ]; then
    echo "test.py is exist."
else
    echo "test.py is not exist."
fi
echo "===="
echo ""

echo "# if, elif, else 예제 # "
var="123"
if [ $var = "12" ]; then
    echo "var is 12"
elif [ $var = "123" ]; then
    echo "var is 123"
else
    echo "(var is not 12) and (var is not 123)"
fi
