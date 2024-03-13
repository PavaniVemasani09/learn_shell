echo "disable and enable backend service"
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
echo "To know success or failure"
echo $?

echo "Install nodejs"
dnf install nodejs -y
echo "To know success or failure"
echo $?

echo "Add application user"
useradd expense
echo "To know success or failure"
echo $?

echo "Copy backend service file into another folder"
cp expense_backend.service /etc/systemd/system/backend.service
echo "To know success or failure"
echo $?


echo "remove directory when we iterate second time"
rm -rf /app
echo $?

echo "make directory app"
mkdir /app
echo $?

echo "Download backend code"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
echo $?

echo "Move to app directory"
cd /app
echo $?

echo "unzip backend code"
unzip /tmp/backend.zip
echo $?

echo "move to app directory"
cd /app
echo $?

echo "Install npm package for dependencies"
npm install
echo $?

echo "Reload backend service file"
systemctl daemon-reload
echo $?

echo "Start service"
systemctl enable backend
systemctl start backend
echo $?

echo "Install mysql server "
dnf install mysql -y
echo $?

echo "Load schema"
mysql -h 172.31.5.158 -uroot -pExpenseApp@1 < /app/schema/backend.sql
echo $?