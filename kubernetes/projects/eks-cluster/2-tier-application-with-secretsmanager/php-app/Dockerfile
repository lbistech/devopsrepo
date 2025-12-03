FROM php:8.1-apache

# Install required PHP extensions for MySQL 8
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy PHP application to Apache web root
COPY index.php /var/www/html/

# Expose port 80 for Apache
EXPOSE 80