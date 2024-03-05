app_dir=/usr/share/nginx/html/
component=frontend
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

#printHeading "clean the old content"
#rm -rf ${app_dir}* &>>LOG
#checkStatus $?
#
#printHeading "download the frontend file"
#curl -o /tmp/${component}.zip https://expense-artifacts.s3.amazonaws.com/expense-${component}-v2.zip &>>LOG
#checkStatus $?
#
#printHeading "move to the nginx location and unzip the file"
#cd /usr/share/nginx/html
#unzip /tmp/frontend.zip &>>LOG
#checkStatus $?
App_preReq

printHeading "Restart nginx"
systemctl restart nginx &>>LOG
checkStatus $?