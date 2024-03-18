#a=10
#b=20
#echo $(($a+$b))

#read -p "Enter number:" num1
#read -p "Enter number2:" num2
#echo $(($num1 + $num2))


#read -p "Enter number :" num1 num2
#echo $(($num1+$num2))

read -p "Enter two values:" num1,num2
read -p "Enter Operator:" op
if [ op == + ] then
  echo $(($num1+$num2))

elif [ op == -] then
echo $(($num1-$num2))

else
  echo "Operator not listed"