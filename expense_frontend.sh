source common_print.sh
print_heading "Install Nginx"
dnf install nginx -y
print_Status

print_heading "Start frontend service"
systemctl enable nginx
systemctl start nginx
print_Status

print_heading "remove default content in an nginx file"
rm -rf /usr/share/nginx/html/*
print_Status

print_heading "copy configuration into nginx config file"
cp expense.conf /etc/nginx/default.d/expense.conf
print_Status

print_heading "Download frontend zip  file"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
print_Status

print_heading "move to nginx html directory"
cd /usr/share/nginx/html
print_Status

print_heading "unzip frontend zip file"
unzip /tmp/frontend.zip
print_Status

print_heading "Load the changes of configuration file"
systemctl restart nginx
print_Status

