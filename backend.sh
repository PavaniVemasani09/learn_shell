#scriptpath="$PWD"
dnf module disable nodejs -y>/tmp/expense.log 2>/tmp/err
dnf module enable nodejs:20 -y>/tmp/expense.log 2>/tmp/err
dnf install nodejs -y>/tmp/expense.log 2>/tmp/err
useradd expense>/tmp/expense.log 2>/tmp/err
cp backend.service /etc/systemd/system/backend.service >/tmp/expense.log 2>/tmp/err
#remove the /app by using below cmd before executing .i.e first iteration will work ,next iterations it wont work.
rm -rf /app>/tmp/expense.log 2>/tmp/err
mkdir /app>/tmp/expense.log 2>/tmp/err
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip>/tmp/expense.log
cd /app>/tmp/expens.log 2>/tmp/err

unzip  /tmp/backend.zip>/tmp/expense.log 2>/tmp/err
cd /app>/tmp/expens.log 2>/tmp/err
npm install>/tmp/expense.log 2>/tmp/err

systemctl daemon-reload>/tmp/expense.log 2>/tmp/err
systemctl enable backend>/tmp/expense.log 2>/tmp/err
systemctl start backend>/tmp/expense.log 2>/tmp/err
dnf install mysql -y>/tmp/expense.log 2>/tmp/err
mysql -h 172.31.4.183 -uroot -pExpenseApp@1 < /app/schema/backend.sql>/tmp/expense.log 2>/tmp/err
