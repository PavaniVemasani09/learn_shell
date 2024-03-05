printHeading "Install nginx"
dnf install nginx -y &>>LOG
checkStatus $?

printHeading "Enable and start nginx"
systemctl enable nginx &>>LOG
systemctl start nginx &>>LOG
checkStatus $?

printHeading "nginx configuration file"
cp expense.conf /etc/nginx/default.d/expense.conf &>>LOG
checkStatus $?

printHeading "remove the default content"
rm -rf /usr/share/nginx/html/* &>>LOG
checkStatus $?

printHeading "download the frontend file"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>LOG
checkStatus $?

printHeading "move to the nginx location and unzip the file"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>LOG
checkStatus $?

printHeading "Restart nginx"
systemctl restart nginx &>>LOG
checkStatus $?