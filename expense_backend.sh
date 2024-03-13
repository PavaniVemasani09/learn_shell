source common_print.sh
mysql_root_password=$1
print_heading "Password should not be hardcoded"

print_heading "disable and enable backend service"
dnf module disable nodejs -y &>>/tmp/expense.log
dnf module enable nodejs:20 -y &>>/tmp/expense.log
print_heading "To know success or failure"
print_status

echo "Install nodejs"
dnf install nodejs -y &>>/tmp/expense.log
print_heading "To know success or failure"
print_status

print_heading "Add application user"
useradd expense &>>/tmp/expense.log
print_heading "To know success or failure"
print_status

print_heading "Copy backend service file into another folder"
cp expense_backend.service /etc/systemd/system/backend.service &>>/tmp/expense.log
print_heading "To know success or failure"
print_status


print_heading "remove directory when we iterate second time"
rm -rf /app &>>/tmp/expense.log
print_status

print_heading "make directory app"
mkdir /app &>>/tmp/expense.log
print_status

print_heading "Download backend code"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>>/tmp/expense.log
print_status

print_heading "Move to app directory"
cd /app &>>/tmp/expense.log
print_status

print_heading "unzip backend code"
unzip /tmp/backend.zip &>>/tmp/expense.log
print_status

print_heading "move to app directory"
cd /app &>>/tmp/expense.log
print_status

print_heading "Install npm package for dependencies"
npm install &>>/tmp/expense.log
print_status

print_heading "Reload backend service file"
systemctl daemon-reload &>>/tmp/expense.log
print_status

print_heading "Start service"
systemctl enable backend &>>/tmp/expense.log
systemctl start backend &>>/tmp/expense.log
print_status

print_heading "Install mysql server "
dnf install mysql -y &>>/tmp/expense.log
print_status

print_heading "Load schema"
mysql -h 172.31.5.158 -uroot -p${mysql_root_password} < /app/schema/backend.sql &>>/tmp/expense.log
print_status