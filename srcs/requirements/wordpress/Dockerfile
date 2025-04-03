FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y wget \
	php php-fpm php-mysql \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*


COPY conf/www.conf /etc/php/7.4/fpm/pool.d/


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# RUN touch /var/log/php-fpm.log && \
#     chown www-data:www-data /var/log/php-fpm.log
	
COPY tools/script_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script_wordpress.sh

EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/script_wordpress.sh"]

CMD ["php-fpm7.4", "-F"]