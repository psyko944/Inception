FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends mariadb-server \
    && rm -rf /var/lib/apt/lists/* var/lib/mysql/

    
RUN mkdir -p /run/mysqld/ /var/lib/mysql \
    && chown mysql:mysql /run/mysqld/ /var/lib/mysql/ \
    && chmod -R 777 /run/mysqld/ /var/lib/mysql/
    
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["usr/local/bin/docker-entrypoint.sh"]

CMD ["mariadbd"]