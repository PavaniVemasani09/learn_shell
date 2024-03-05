printHeading()
{
  echo $1
  echo "##############$1 #############" &>>/tmp/expense.log
}
checkStatus()
{
  if [ $? -eq 0 ];then
    echo SUCCESS
    else
      echo FAILURE
  fi
}