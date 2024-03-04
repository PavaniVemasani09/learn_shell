[Unit]
Description = Backend Service

[Service]
User=expense
Environment=DB_HOST="172.31.4.183"
ExecStart=/bin/node /app/index.js
SyslogIdentifier=backend

[Install]
WantedBy=multi-user.target