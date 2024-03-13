print_heading()
{
  echo $1
  echo "################" $1 "##############" &>>/tmp/expense.log
}
print_status()
{
  echo $?
}
print_root_password()
{
  mysql_root_password=$1
}