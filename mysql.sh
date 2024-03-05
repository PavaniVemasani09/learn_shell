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
echo 'show databases' | mysql -h 172.31.4.183 -uroot -p${mysql_root_passwd} &>>LOG
if [ $? -ne 0 ];then
  mysql_secure_installation --set-root-pass ${mysql_root_passwd} &>>LOG
  fi
checkStatus $?