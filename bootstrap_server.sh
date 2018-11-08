#!/bin/bash
set -e
sudo yum -y update
echo "yum update done."
sudo yum -y upgrade
sudo yum -y install java-1.8.0-openjdk.x86_64
echo "java installed"
cat > /tmp/nginx.repo <<EOF
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/rhel/7/x86_64/
gpgcheck=0
enabled=1
EOF
sudo mv /tmp/nginx.repo /etc/yum.repos.d/nginx.repo
sudo rpm -Uvh http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm
sudo yum -y install nginx
echo "nginx installed"
cat > /tmp/index.html <<EOF
<!DOCTYPE html>
<html>
<head><title>Hey nginx!</title></head>
<body>
<h1>Success!</h1>
</body>
</html>
EOF
sudo mv /tmp/index.html /usr/share/nginx/html/index.html
echo "nginx static webpage added"
sudo service nginx start
sudo systemctl enable nginx
echo "nginx started"
curl http://localhost/