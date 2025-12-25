# 1. استخدام نسخة PHP الرسمية مع Apache (تأتي بـ mpm_prefork مفعلاً تلقائياً)
FROM php:8.2-apache

# 2. تثبيت إضافات النظام و PHP اللازمة
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 3. تثبيت Composer من الصورة الرسمية
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. تفعيل موديل Rewrite وتجهيز إعدادات Apache
# ملاحظة: تم حذف محاولة تبديل MPM يدوياً لأنها تسبب التعارض AH00534 في صور PHP الرسمية
RUN a2enmod rewrite

# 5. ضبط المجلد الرئيسي للعمل
WORKDIR /var/www/html

# 6. نسخ ملفات المشروع بالكامل
COPY . .

# 7. تثبيت مكتبات Composer
# تم استخدام --no-scripts لتجنب المشاكل أثناء بناء الصورة إذا كان هناك ملفات ناقصة
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

# 8. ضبط الصلاحيات للمجلدات المهمة في Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# 9. تعديل إعدادات Apache لتوجه إلى مجلد public (لعمل Laravel بشكل صحيح)
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 10. إخبار المنصة بأن التطبيق يستمع للمنفذ 80
EXPOSE 80

# 11. تشغيل Apache في الواجهة الأمامية (Foreground)
# هذا الأمر يضمن بقاء الحاوية (Container) تعمل واستقبال الطلبات
CMD ["apache2-foreground"]
