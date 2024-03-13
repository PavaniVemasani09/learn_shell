LOG=/tmp/expense.log
print_heading()
{
  echo $1
  echo "################" $1 "##############" &>>/tmp/expense.log
}
print_status()
{
#  echo $?
  if [ $1 -eq 0 ];then
  echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILURE\e[0m"

  fi
}
App_task_code()
{
print_heading "clean directory when we iterate second time"
rm -rf /app &>>$LOG
print_status $?

print_heading "Download frontend zip  file"
curl -o /tmp/${component}.zip https://expense-artifacts.s3.amazonaws.com/expense-${component}-v2.zip &>>$LOG
print_status $?

#print_heading "unzip frontend zip file"
#unzip /tmp/${component}.zip &>>$LOG
#print_status $?

}
