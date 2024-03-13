source common_print.sh
mysql_root_password=$1
if [ -z "${mysql_root_password}" ];then
  print_heading "Root password is missing"
  print_status $?
  exit 1
  fi

print_heading "Install Mysql server"
dnf install mysql-server -y &>>LOG
print_status $?

print_heading "start mysql service"
systemctl enable mysqld &>>LOG
systemctl start mysqld &>>LOG
print_status $?

print_heading "set root password"
echo 'show databases' | mysql -h 172.31.11.119 -uroot -pExpenseApp@1
if [ $? -ne 0 ];then
mysql_secure_installation --set-root-pass {mysql_root_password} &>>s$LOG
fi
print_status $?