FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y wget \
	php php-fpm php-mysql \
	mariadb-client \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*


COPY conf/www.conf /etc/php/8.3/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp


RUN mkdir -p /run/php

COPY tools/script_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script_wordpress.sh

ENTRYPOINT ["/usr/local/bin/script_wordpress.sh"]
EXPOSE 9000

CMD ["php-fpm8.3", "-F"]