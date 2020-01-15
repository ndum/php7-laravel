# php7-laravel

[![Build Status](https://travis-ci.org/ndum/php7-laravel.svg)](https://travis-ci.org/ndum/php7-laravel)

**This is an inofficial repository for Laravel 6/5 optimized PHP 7.x Docker images**

*(it's based on Laravel Settler - see https://github.com/laravel/settler/blob/master/scripts/provision.sh)*

This Docker images can be used for many different Continous Integration (CI) enviroments. 
But it is mainly made for the wonderful GitLab-CI. Examples can be found under /examples. For more information see the Dockerfile.

# Laravel Dusk:
Laravel Dusk is tested with this images from Laravel 5.4 to Laravel 6.x Please use https://github.com/staudenmeir/dusk-updater for the newest Chromedriver if necessary.

# Built with:
* Yarn / NPM
* PHP 7.2 - PHP 7.4 (see https://cloud.docker.com/repository/docker/ndum/php7-laravel/tags)
* MySQL / PostgreSQL and SQLite
* PHPUnit
* Google Chrome

# Docker Hub Automated build:
ndum/php7-laravel is available as a Docker Hub Trusted Build.

# License:
php7-laravel is a MIT-licensed open source project.