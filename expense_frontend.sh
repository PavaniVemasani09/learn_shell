dnf install nginx -y
systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cp expense_frontend_service /etc/nginx/default.d/expense.conf
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

systemctl restart nginx