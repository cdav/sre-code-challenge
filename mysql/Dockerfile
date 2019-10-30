FROM mysql:8.0


# ENV vars should be changed or overriden for higher envs
ENV MYSQL_RANDOM_ROOT_PASSWORD='yes'
ENV MYSQL_USER='MYUSER'
ENV MYSQL_PASSWORD='MYPASSWORD'
ENV MYSQL_DATABASE='mydb'

COPY files/db_seed.sql /docker-entrypoint-initdb.d

