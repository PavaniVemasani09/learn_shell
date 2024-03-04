#scriptpath="$PWD"
dnf module disable nodejs -y>/tmp/expens.log
dnf module enable nodejs:20 -y>/tmp/expens.log
dnf install nodejs -y>/tmp/expens.log
useradd expense>/tmp/expens.log
cp backend.service /etc/systemd/system/backend.service>/tmp/expens.log
#remove the /app by using below cmd before executing .i.e first iteration will work ,next iterations it wont work.
rm -rf /app>/tmp/expens.log
mkdir /app>/tmp/expens.log
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip>/tmp/expens.log
cd /app>/tmp/expens.log

unzip  /tmp/backend.zip>/tmp/expens.log
cd /app>/tmp/expens.log
npm install>/tmp/expens.log

systemctl daemon-reload>/tmp/expens.log
systemctl enable backend>/tmp/expens.log
systemctl start backend>/tmp/expens.log
dnf install mysql -y>/tmp/expens.log
mysql -h 172.31.4.183 -uroot -pExpenseApp@1 < /app/schema/backend.sql>/tmp/expens.log
