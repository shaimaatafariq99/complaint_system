FROM php:8.2-apache

# 1. تثبيت الإضافات الأساسية
RUN apt-get update && apt-get install -y \
    libpng-dev libonig-dev libxml2-dev zip unzip git curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 2. تثبيت Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 3. الحل القاطع لمشكلة الـ MPM و الـ Syntax Error:
# سنقوم بحذف جميع ملفات الـ MPM من المجلدات المفعلة (enabled) لضمان عدم تحميل أي إعدادات خاطئة
RUN rm -f /etc/apache2/mods-enabled/mpm_* \
    && a2enmod mpm_prefork \
    && a2enmod rewrite

WORKDIR /var/www/html
COPY . .

# 4. تثبيت المكتبات
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

# 5. الصلاحيات
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# 6. إعدادات المسارات (Laravel Public)
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 7. التوافق مع منافذ Railway المتغيرة (مهم جداً)
RUN sed -i 's/Listen 80/Listen ${PORT}/g' /etc/apache2/ports.conf \
    && sed -i 's/:80/:${PORT}/g' /etc/apache2/sites-available/*.conf

# المنفذ الافتراضي للـ Container
EXPOSE 80

# 8. التشغيل
CMD ["apache2-foreground"]
