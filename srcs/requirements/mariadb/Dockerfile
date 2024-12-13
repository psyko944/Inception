FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends mariadb-server 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/run/mysqld /var/lib/mysql \
    && chown mysql:mysql /var/run/mysqld/ /var/lib/mysql/ \
    && chmod -R 755 /var/run/mysqld/ /var/lib/mysql/

COPY ./tools/docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["usr/local/bin/docker-entrypoint.sh"]

CMD ["mariadb"]