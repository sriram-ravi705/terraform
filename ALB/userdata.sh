#!/bin/bash
sudo yum update
sudo -i
yum install httpd -y
systemctl enable --now httpd
echo "<h1>$(hostname -I | cut -d' ' -f1)</h1>" > /var/www/html/index.html#!/bin/bash
# Update the system
yum update -y

# Install Apache HTTP server (httpd)
yum install httpd -y

# Enable and start the Apache service
systemctl enable httpd --now

# Create a simple HTML page with the EC2 instance's IP address
echo "<h1>$(hostname -I | cut -d' ' -f1)</h1>" > /var/www/html/index.html

# Restart httpd to ensure it's running and the changes take effect
systemctl restart httpd
