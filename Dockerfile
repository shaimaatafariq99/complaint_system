# 1. استخدام نسخة PHP الرسمية مع Apache
FROM php:8.2-apache

# 2. تثبيت الإضافات اللازمة لنظام التشغيل و PHP
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

# 4. تفعيل موديلات Apache الضرورية وتعطيل المتعارضة
# تم نقل هذا الأمر للأعلى لضمان إعداد النظام قبل نسخ الملفات
RUN a2dismod mpm_event mpm_worker || true \
    && a2enmod mpm_prefork \
    && a2enmod rewrite

# 5. ضبط المجلد الرئيسي
WORKDIR /var/www/html

# 6. نسخ ملفات المشروع
COPY . .

# 7. تثبيت المكتبات (تجاهل قيود المنصة)
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs

# 8. الصلاحيات
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# 9. تعديل إعدادات Apache للمجلد public
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 10. ضبط المنفذ
EXPOSE 80

# 11. أمر التشغيل النهائي لضمان عدم تكرار خطأ MPM
CMD ["apache2-foreground"]
