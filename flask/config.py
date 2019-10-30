import os

class Config(object):
    MYSQL_DATABASE_USER = os.environ.get('MYSQL_DATABASE_USER')
    MYSQL_DATABASE_PASSWORD = os.environ.get('MYSQL_DATABASE_PASSWORD')
    MYSQL_DATABASE_DB = os.environ.get('MYSQL_DATABASE_DB')
    MYSQL_DATABASE_HOST = os.environ.get('MYSQL_DATABASE_HOST')