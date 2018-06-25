# php7-laravel

[![Build Status](https://travis-ci.org/ndum/php7-laravel.svg)](https://travis-ci.org/ndum/php7-laravel)

**This is an unofficial Repository for a Laravel 5 optimized PHP-7 Docker Container** 

*(it's based on Laravel Settler - see https://github.com/laravel/settler/blob/master/scripts/provision.sh)*

This Docker Container can be used for many Continous Integration (CI) enviroments. But it is mainly made for the wonderful GitLab-CI. 
Examples can be found under /examples. For more information see the Dockerfile.

# Laravel Dusk:
Laravel Dusk is tested with Gitlab-CI 11.0 and Laravel 5.6. Please use https://github.com/staudenmeir/dusk-updater for the newest Chromedriver

# Built with:
* Yarn / NPM
* PHP 7.2 with xDebug
* MySQL / PostgreSQL and SQLite
* PHPUnit
* Google Chrome

# Docker Hub Automated build:
ndum/php7-laravel is available as a Docker Hub Trusted Build.

# License:
php7-laravel is a MIT-licensed open source project.
