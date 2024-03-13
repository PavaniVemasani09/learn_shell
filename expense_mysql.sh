source common_print.sh
mysql_root_password=$1
print_heading "Install Mysql server"
dnf install mysql-server -y &>>/tmp/expense.log
print_status

print_heading "start mysql service"
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
print_status

print_heading "set root password"
mysql_secure_installation --set-root-pass print_root_password &>>/tmp/expense.log
print_status