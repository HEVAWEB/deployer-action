FROM php:7.3-cli-alpine

RUN apk update --no-cache
RUN apk add --no-cache \
    bash \
    rsync \
    openssh-client

RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN curl -L https://deployer.org/releases/v6.6.0/deployer.phar > /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN dep -v

ENTRYPOINT ["/entrypoint.sh"]
