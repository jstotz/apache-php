FROM php:7.2-apache AS base

COPY . /var/www/html/

FROM base AS blue

ENV COLOR=blue

FROM base AS green

ENV COLOR=green

FROM base

ENV COLOR=red
