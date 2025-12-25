FROM php:8.2-apache

# 1. تثبيت المتطلبات الأساسية
RUN apt-get update && apt-get install -y \
    libpng-dev libonig-dev libxml2-dev zip unzip git curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 2. تثبيت Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 3. الحل القسري: تعديل ملفات Apache الأساسية
# سنقوم بتعطيل كل الـ MPMs برمجياً ثم تفعيل prefork فقط
RUN sed -i '/mpm_event_module/s/^/#/' /etc/apache2/mods-available/mpm_event.load || true \
    && sed -i '/mpm_worker_module/s/^/#/' /etc/apache2/mods-available/mpm_worker.load || true \
    && a2dismod mpm_event mpm_worker || true \
    && a2enmod mpm_prefork \
    && a2enmod rewrite

WORKDIR /var/www/html
COPY . .

# 4. تثبيت مكتبات المشروع
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

# 5. الصلاحيات
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# 6. توجيه Apache لمجلد public
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 7. حل مشكلة المنفذ في Railway
# المنصة أحياناً تجبر التطبيق على منفذ مختلف، لذا سنخبر Apache بالاستماع لأي منفذ تحدده المنصة
RUN sed -i 's/Listen 80/Listen ${PORT}/g' /etc/apache2/ports.conf
RUN sed -i 's/:80/:${PORT}/g' /etc/apache2/sites-available/*.conf

EXPOSE 80

# 8. التشغيل
CMD ["apache2-foreground"]
