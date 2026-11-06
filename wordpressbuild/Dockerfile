FROM wordpress:php8.3-apache

# Custom PHP configuration
COPY ./custom.ini /usr/local/etc/php/conf.d/zz-custom.ini

# Install WP-CLI
RUN curl -fsSLo /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

# Copy bundled plugins into the official WordPress image's source directory
COPY ./plugins/ /usr/src/wordpress/wp-content/plugins/
