LOG=/tmp/expense.log
print_heading()
{
  echo $1
  echo "################" $1 "##############" &>>/tmp/expense.log
}
print_status()
{
  echo $?
  if [ $0 -eq 0 ];then
  echo SUCCESS
  else
    echo FAILURE
  fi
}
