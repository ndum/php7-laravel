#!/bin/bash

# Install dependencies only for Docker.
[[ ! -e /.dockerenv ]] && [[ ! -e /.dockerinit ]] && exit 0
set -xe

# Install Composer and project dependencies.
curl -sS https://getcomposer.org/installer | php
php composer.phar install --no-interaction --prefer-source

# Copy over testing configuration.
cp .env.gitlab-ci .env

# Generate a app key.
php artisan key:generate

# Run database migrations.
php artisan migrate