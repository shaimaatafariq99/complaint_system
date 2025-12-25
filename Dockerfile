FROM php:8.2-apache

# 1. تثبيت الإضافات
RUN apt-get update && apt-get install -y \
    libpng-dev libonig-dev libxml2-dev zip unzip git curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 2. تثبيت Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 3. الحل النهائي لتعارض MPM (تنظيف كامل للمجلدات)
RUN rm -rf /etc/apache2/mods-enabled/mpm_event.load \
    && rm -rf /etc/apache2/mods-enabled/mpm_worker.load \
    && rm -rf /etc/apache2/mods-available/mpm_event.conf \
    && a2dismod mpm_event mpm_worker || true \
    && a2enmod mpm_prefork \
    && a2enmod rewrite

WORKDIR /var/www/html
COPY . .

# 4. تثبيت المكتبات
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

# 5. الصلاحيات
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# 6. ضبط المسار لـ Laravel
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

EXPOSE 80

# 7. الأمر القاطع: تشغيل Apache مع تجاهل الأخطاء القديمة
CMD ["apache2-foreground"]
