# init.sh

#!/bin/bash

echo "Initializing Jeedom..."

# Change Apache port
sed -i "s/Listen 80/Listen ${HTTP_PORT}/" /etc/apache2/ports.conf
sed -i "s/VirtualHost \*:80/VirtualHost \*:${HTTP_PORT}/" /etc/apache2/sites-available/000-default.conf

# Restart Apache
service apache2 restart

# Create Jeedom user
php /var/www/html/core/php/jeecli.php user password [username] [password]

echo "Initialization complete."
