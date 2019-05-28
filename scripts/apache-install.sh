#!/bin/sh
# First lets update the system
yum -y update 
# Then install apache server
yum -y install httpd
# Configure firewall and SELinux
setenforce 0
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
# Add Hello World Message
cat <<EOF > /var/www/html/index.html
<html>
<body>
    <span wicket:id="message">Azure loves opensource</span>
</body>
</html>
EOF
# Start and configure automatic start for the service 
systemctl enable httpd
systemctl start httpd.service