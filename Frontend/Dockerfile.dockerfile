FROM remote_host

RUN yum -y install epel-release && \
    yum -y install nginx php-fpm php-mysqlnd && \
    yum clean all && \
    rm -rf /var/cache/yum

EXPOSE 80 443

VOLUME ["/var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm"]

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]