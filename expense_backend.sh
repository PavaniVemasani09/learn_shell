echo "disable and enable backend service"
dnf module disable nodejs -y >/tmp/expense.log
dnf module enable nodejs:20 -y >/tmp/expense.log
echo "To know success or failure"

echo "Install nodejs"
dnf install nodejs -y >/tmp/expense.log
echo "To know success or failure"


echo "Add application user"
useradd expense >/tmp/expense.log
echo "To know success or failure"


echo "Copy backend service file into another folder"
cp expense_backend.service /etc/systemd/system/backend.service >/tmp/expense.log
echo "To know success or failure"



echo "remove directory when we iterate second time"
rm -rf /app >/tmp/expense.log


echo "make directory app"
mkdir /app >/tmp/expense.log


echo "Download backend code"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip >/tmp/expense.log


echo "Move to app directory"
cd /app >/tmp/expense.log


echo "unzip backend code"
unzip /tmp/backend.zip >/tmp/expense.log


echo "move to app directory"
cd /app >/tmp/expense.log


echo "Install npm package for dependencies"
npm install >/tmp/expense.log


echo "Reload backend service file"
systemctl daemon-reload >/tmp/expense.log


echo "Start service"
systemctl enable backend >/tmp/expense.log
systemctl start backend >/tmp/expense.log


echo "Install mysql server "
dnf install mysql -y >/tmp/expense.log


echo "Load schema"
mysql -h 172.31.5.158 -uroot -pExpenseApp@1 < /app/schema/backend.sql >/tmp/expense.log
