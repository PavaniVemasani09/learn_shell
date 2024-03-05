#scriptpath="$PWD"
source common.sh
mysql_root_passwd=$1
if [ -z "${mysql_root_passwd}" ];then
  echo "MySQL Password is missing"
  exit 1
  else
    echo -e "\e[32m SUCCESS\e[0m"
    fi

printHeading "disable default NodeJS Version module"
dnf module disable nodejs -y &>>/tmp/expense.log

printHeading "enable default NodeJs Version module"
dnf module enable nodejs:20 -y &>>/tmp/expense.log
checkStatus $?

printHeading "Install NodeJs"
dnf install nodejs -y &>>/tmp/expense.log
checkStatus $?

printHeading "adding application user"
useradd expense &>>/tmp/expense.log
checkStatus $?

printHeading "Copy Backend Service file"
cp backend.service /etc/systemd/system/backend.service &>>/tmp/expense.log 
checkStatus $?

#remove the /app by using below cmd before executing .i.e first iteration will work ,next iterations it wont work.
printHeading "clean the old content"
rm -rf /app &>>/tmp/expense.log
checkStatus $?

printHeading "make a directory"
mkdir /app &>>/tmp/expense.log 
checkStatus $?

printHeading "download backend zip file"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>/tmp/expense.log
checkStatus $?

printHeading "move to the specific directory and unzip the file"
cd /app &>>/tmp/expens.log
unzip  /tmp/backend.zip &>>/tmp/expense.log
checkStatus $?

printHeading "install npm"
cd /app &>>/tmp/expens.log
npm install &>>/tmp/expense.log 
checkStatus $?

printHeading "start backend service"

systemctl daemon-reload &>>/tmp/expense.log 
systemctl enable backend &>>/tmp/expense.log 
systemctl start backend &>>/tmp/expense.log 
checkStatus $?

printHeading "Install MySQL Client"
dnf install mysql -y &>>/tmp/expense.log
checkStatus $?

printHeading "Install Load Schema"
mysql -h 172.31.4.183 -uroot -p${mysql_root_passwd} < /app/schema/backend.sql &>>/tmp/expense.log
checkStatus $?
