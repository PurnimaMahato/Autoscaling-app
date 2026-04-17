#!/bin/bash

# 1. Update the package lists
apt-get update

# 2. Install NGINX and Git
apt-get install -y nginx git

# 3. Clone the GitHub Repository
git clone https://github.com/PurnimaMahato/Autoscalling-app.git app

# 4. Remove the default NGINX placeholder page
rm -f /var/www/html/index.nginx-debian.html

# 5. Copy the cloned HTML files to the NGINX web directory
cp -r app/* /var/www/html/

# 6. Set proper ownership and permissions for the web server
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# 7. Restart and enable NGINX to apply changes
systemctl restart nginx
systemctl enable nginx
