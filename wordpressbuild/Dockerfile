FROM wordpress:latest

# Default UID/GID in case args not passed
ARG LOCAL_UID=1000
ARG LOCAL_GID=1000

COPY ./custom.ini "$PHP_INI_DIR/php.ini"
COPY ./plugins/ "/usr/src/wordpress/wp-content/plugins/"

RUN docker-php-ext-install pdo_mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/wp
 
# Ensure the group and user IDs match host user
RUN set -eux; \
    echo "Adjusting www-data UID/GID to ${LOCAL_UID}:${LOCAL_GID}"; \
    groupmod -g ${LOCAL_GID} www-data || true; \
    usermod -u ${LOCAL_UID} www-data || true; \
    chown -R www-data:www-data /var/www/html

USER www-data