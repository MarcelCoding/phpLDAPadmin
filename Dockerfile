FROM alpine:latest

ENV LDAP_PORT=389

RUN apk add --update --no-cache php7-apache2 php7-session php7-gettext php7-ldap php7-xml \
 && rm -rf /var/www/localhost/htdocs/*

COPY . /var/www/localhost/htdocs/

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

EXPOSE 80
ENTRYPOINT ["httpd", "-DFOREGROUND"]
