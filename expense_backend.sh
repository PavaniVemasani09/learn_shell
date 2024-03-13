source common_print.sh
mysql_root_password=$1
if [ -z  "${mysql_root_password}" ];then
  print_heading "Input status missing"
  exit 1
fi

print_heading "disable and enable backend service"
dnf module disable nodejs -y &>>LOG
dnf module enable nodejs:20 -y &>>LOG
print_status $?

ptint_heading "Install nodejs"
dnf install nodejs -y &>>LOG
print_status

print_heading "Add application user"
useradd expense &>>LOG
print_status

print_heading "Copy backend service file into another folder"
cp expense_backend.service /etc/systemd/system/backend.service &>>LOG
print_status


print_heading "remove directory when we iterate second time"
rm -rf /app &>>LOG
print_status

print_heading "make directory app"
mkdir /app &>>LOG
print_status

print_heading "Download backend code"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>>LOG
print_status

print_heading "Move to app directory"
cd /app &>>LOG
print_status

print_heading "unzip backend code"
unzip /tmp/backend.zip &>>LOG
print_status

print_heading "move to app directory"
cd /app &>>LOG
print_status

print_heading "Install npm package for dependencies"
npm install &>>LOG
print_status

print_heading "Reload backend service file"
systemctl daemon-reload &>>LOG
print_status

print_heading "Start service"
systemctl enable backend &>>LOG
systemctl start backend &>>LOG
print_status

print_heading "Install mysql server "
dnf install mysql -y &>>LOG
print_status

print_heading "Load schema"
mysql -h 172.31.11.119  -uroot -p${mysql_root_password} < /app/schema/backend.sql &>>LOG
print_status