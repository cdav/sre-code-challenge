FROM python:3.7-stretch

EXPOSE 5000
ENV FLASK_APP=main.py 

# ENV vars should be changed or overriden for higher envs
ENV MYSQL_DATABASE_USER = 'MYUSER'
ENV MYSQL_DATABASE_PASSWORD = 'MYPASSWORD'
ENV MYSQL_DATABASE_DB = 'mydb'
ENV MYSQL_DATABASE_HOST = 'scc-mysql'

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt
 
RUN useradd appuser
WORKDIR /home/appuser
RUN chown appuser:appuser /home/appuser
USER appuser

COPY --chown=appuser:appuser main.py ./
COPY --chown=appuser:appuser config.py ./

RUN chmod -R 700 /home/appuser

ENTRYPOINT [ "flask" ]
CMD [ "run", "--host=0.0.0.0"] 