#!/bin/bash

FILE=/var/www/html/wp-config.php
# Check if the WordPress CLI is installed.
echo "beginning script"
if [ ! -f "$FILE" ]; then
    # Create a directory for wordpress.
    echo "installing wordpress"
    mkdir -p /var/www/html
    wp core download --allow-root --path="/var/www/html"

    # Copy the sample configuration file and replace placeholders with actual data.
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    sed -i -e "s/database_name_here/$SQL_DATABASE/g" /var/www/html/wp-config.php
    sed -i -e "s/username_here/$SQL_USER/g" /var/www/html/wp-config.php
    sed -i -e "s/password_here/$SQL_PASSWORD/g" /var/www/html/wp-config.php
    sed -i -e "s/localhost/mariadb/g" /var/www/html/wp-config.php

    # installing wordpress with cli and create an admin user.
    wp core install --allow-root \
    --url=$WP_URL \
    --title="$WP_TITLE" \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL --path='/var/www/html'

    # # Install and activate the custom theme.
    # wp theme install "Abhasa" --allow-root --path='/var/www/html'
    # wp theme activate Abhasa --allow-root --path='/var/www/html'


    # # Create a suscriber.
    # wp --allow-root user create $WP_GUEST_USER $WP_GUEST_EMAIL --user_pass=$WP_GUEST_PASSWORD --path='/var/www/html'
    echo "WordPress installed successfully."
fi

chown -R www-data:www-data /var/www/html
echo "WordPress configuration file created successfully."
# Starting PHP-FPM service.
exec "$@"