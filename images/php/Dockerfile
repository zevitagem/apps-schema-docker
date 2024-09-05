# Usa uma imagem base do PHP com Apache
FROM php:8.1-apache

# Instala dependências básicas e ferramentas
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    git \
    curl \
    libonig-dev \
    libicu-dev \
    libxml2-dev

# Bloco para instalação de extensões PHP específicas para MySQL
RUN docker-php-ext-install pdo pdo_mysql zip

# Instala o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instala o Node.js e npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Copia o código da aplicação para o contêiner
COPY src/ /var/www/html/

# Copia a configuração personalizada do Apache
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Define o diretório de trabalho
WORKDIR /var/www/html

# Expõe a porta 80
EXPOSE 80

# O comando padrão do Docker para iniciar o Apache
CMD ["apache2-foreground"]
