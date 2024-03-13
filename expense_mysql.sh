source common_print.sh
mysql_root_password=$1
if [ -z "${mysql_root_password}" ];then
  print_heading "Root password is missing"
  print_status $?
  fi

print_heading "Install Mysql server"
dnf install mysql-server -y &>>LOG
print_status $?

print_heading "start mysql service"
systemctl enable mysqld &>>LOG
systemctl start mysqld &>>LOG
print_status $?

print_heading "set root password"
mysql_secure_installation --set-root-pass {mysql_root_password} &>>LOG
print_status $?