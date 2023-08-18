FROM php:7.2-apache

ARG FOO
RUN echo "foo: $FOO"
RUN --mount=type=secret,id=FOO cat /run/secrets/FOO
COPY . /var/www/html/
