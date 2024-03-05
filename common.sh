printHeading()
{
  echo $1
  echo "##############$1 #############" &>>/tmp/expense.log
}
checkStatus()
{
  if [ $? -eq 0 ];then
    echo -e "\e[31mSUCCESS\e[0m"
    else
      echo -e "\e[31m FAILURE\e[0m"
  fi
}
