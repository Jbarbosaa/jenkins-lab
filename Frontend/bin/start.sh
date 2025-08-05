#!/bin/bash

# Starts ssh

/usr/sbin/sshd

# Starts php proccess in background

mkdir -p /run/php-fpm && /usr/sbin/php-fpm -c /etc/php/fpm

# Starts nginx daemon

nginx -g 'daemon off;'