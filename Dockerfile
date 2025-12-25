# استخدام نسخة PHP الرسمية مع Apache
FROM php:8.2-apache

# تثبيت الإضافات اللازمة لـ Laravel
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl

# تثبيت إضافات PHP لـ MySQL أو PostgreSQL
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# تفعيل موديل Apache Rewrite (ضروري لـ Laravel)
RUN a2enmod rewrite

# ضبط المجلد الرئيسي داخل الحاوية
WORKDIR /var/www/html

# نسخ ملفات المشروع
COPY . .

# تثبيت Composer
FROM composer:latest AS composer
# 1. تحديد مسار العمل الصحيح (يفضل استخدام المسار الافتراضي لـ Apache)
WORKDIR /var/www/html

# 2. نسخ الملفات إلى المسار الحالي
COPY . .

# 3. تشغيل الـ composer (مع تجاهل قيود الإصدار لحل مشكلة PHP 8.5)
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs

# 4. تغيير الصلاحيات الآن ستعمل لأن المجلدات موجودة في المسار الحالي
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# تغيير المجلد الرئيسي ليكون public (مهم جداً)
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# ضبط المنفذ (Render يمرر المنفذ تلقائياً)
EXPOSE 80
