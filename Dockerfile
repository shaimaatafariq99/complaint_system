FROM php:8.2-apache

# تثبيت المتطلبات
RUN apt-get update && apt-get install -y \
    libpng-dev libonig-dev libxml2-dev libxml2 \
    zip unzip git curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 🔥 الحل الصحيح لمشكلة MPM
RUN a2dismod mpm_event mpm_worker \
    && a2enmod mpm_prefork rewrite

WORKDIR /var/www/html
COPY . .

# Composer install
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

# صلاحيات Laravel
RUN chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# Document Root
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf

# Railway PORT
RUN sed -i 's/Listen 80/Listen ${PORT}/g' /etc/apache2/ports.conf \
    && sed -i 's/:80/:${PORT}/g' /etc/apache2/sites-available/*.conf

EXPOSE 80

CMD ["apache2-foreground"]
