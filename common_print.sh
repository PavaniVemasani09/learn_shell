LOG=/tmp/expense.log
print_heading()
{
  echo $1
  echo "################" $1 "##############" &>>/tmp/expense.log
}
print_status()
{
  echo $?
}
