LOG=/tmp/expense.log
printHeading()
{
  echo $1
  echo "##############$1 #############" &>>$LOG
}
checkStatus()
{
  if [ $? -eq 0 ];then
    echo -e "\e[32mSUCCESS\e[0m"
    else
      echo -e "\e[31m FAILURE\e[0m"
  fi
}
App_preReq()
{
 printHeading "clean the old content"
 rm -rf /${app_dir} &>>$LOG
 checkStatus $?

 printHeading "make a directory"
 mkdir /${app_dir} &>>$LOG
 checkStatus $?

 printHeading "download backend zip file"
 curl -o /tmp/ba${component}.zip https://expense-artifacts.s3.amazonaws.com/expense-${component}-v2.zip &>$LOG
 checkStatus $?

 printHeading "Extract the app content"
 cd /app &>>/tmp/expens.log
 unzip  /tmp/${component}.zip &>>$LOG
 checkStatus $?

}