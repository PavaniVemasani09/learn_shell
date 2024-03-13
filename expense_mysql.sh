source common_print.sh
print_heading "Install Mysql server"
dnf install mysql-server -y
print_status

print_heading "start mysql service"
systemctl enable mysqld
systemctl start mysqld
print_status

print_heading "set root password"
mysql_secure_installation --set-root-pass ExpenseApp@1
print_status