# mysql db
FROM mysql

RUN chown -R mysql:root /var/lib/mysql/

ARG MYSQL_PASSWORD
ARG MYSQL_USER
ARG MYSQL_DATABASE

# use '$ENV_VARIABLE' to access .env file
ENV MYSQL_PASSWORD=password
ENV MYSQL_USER=user
ENV MYSQL_DATABASE=db

# optional: use .sql file
ADD data.sql /etc/mysql/data.sql
RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /etc/mysql/data.sql
RUN cp /etc/mysql/data.sql /docker-entrypoint-initdb.d

EXPOSE 3306