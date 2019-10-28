FROM mysql:8.0

COPY files/db_seed.sql /docker-entrypoint-initdb.d

ENV MYSQL_ROOT_PASSWORD='sup3rs3cr3t'
ENV MYSQL_USER='MYUSER'
ENV MYSQL_DATABASE='mydb'
ENV MYSQL_PASSWORD='MYPASS'
 
#COPY files/db_seed.sql /docker-entrypoint-initdb.d

