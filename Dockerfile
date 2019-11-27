FROM php:7.3-cli-alpine

RUN apk update --no-cache
RUN apk add --no-cache \
    bash \
    git \
    zip \
    rsync \ 
    openssh-client

RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN curl -L https://deployer.org/releases/v6.6.0/deployer.phar > /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN dep -v \
    && composer -v

ENTRYPOINT ["/entrypoint.sh"]