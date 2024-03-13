source common_print.sh
app_dir=/usr/share/nginx/html
component=frontend
print_heading "Install Nginx"
dnf install nginx -y &>>$LOG
print_status $?

print_heading "Start frontend service"
systemctl enable nginx &>>$LOG
systemctl start nginx &>>$LOG
print_status $?

#print_heading "clean default content in an nginx file"
#rm -rf ${app_dir}/* &>>$LOG
#print_status $?
App_task_code

print_heading "copy configuration into nginx config file"
cp expense.conf /etc/nginx/default.d/expense.conf &>>$LOG
print_status $?



#print_heading "Download frontend zip  file"
#curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>$LOG
#print_status $?

print_heading "move to nginx html directory"
cd ${app_dir} &>>$LOG
print_status $?

print_heading "unzip frontend zip file"
unzip /tmp/${component}.zip &>>$LOG
print_status $?

print_heading "Load the changes of configuration file"
systemctl restart nginx &>>$LOG
print_status $?

