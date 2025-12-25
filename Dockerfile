# 1. استخدام نسخة PHP الرسمية مع Apache
FROM php:8.2-apache

# 2. تثبيت الإضافات الضرورية للنظام ولـ PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 3. تثبيت Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. الحل الجذري لخطأ MPM:
# نقوم بحذف كافة ملفات MPM المفعلة يدوياً ثم نُفعل prefork فقط لضمان عدم التكرار
RUN rm -f /etc/apache2/mods-enabled/mpm_* \
    && a2enmod mpm_prefork \
    && a2enmod rewrite

# 5. ضبط المجلد الرئيسي
WORKDIR /var/www/html

# 6. نسخ ملفات المشروع
COPY . .

# 7. تثبيت المكتبات (تجاهل السكريبتات لتجنب الأخطاء أثناء البناء)
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

# 8. الصلاحيات
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# 9. تعديل المسار ليوجه إلى مجلد public الخاص بـ Laravel
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 10. إعداد المنفذ
EXPOSE 80

# 11. الأمر النهائي للتشغيل
CMD ["apache2-foreground"]
