FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get install --no-install-recommends --no-install-suggests -y nginx openssl \
	&& rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/nginx/ssl /run/nginx \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:4096  \
	-out /etc/nginx/ssl/mekherbo.crt \
	-keyout /etc/nginx/ssl/mekherbo.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=mekherbo.42.fr/CN=mekherbo.42.fr/UID=mekherbo" \
	&& chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/ 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
