mysql_root_passwd=$1
if [ -z "${mysql_root_passwd}" ];then
  echo "Password is missing"
  exit -e "\e[31mPassword is missing\e[0m"
  fi
printHeading "Install Mysql server"
dnf install mysql-server -y &>>LOG
checkStatus $?

printHeading "Enable and start the server"
systemctl enable mysqld &>>LOG
systemctl start mysqld &>>LOG
checkStatus $?

printHeading "Install nginx"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>LOG
checkStatus $?