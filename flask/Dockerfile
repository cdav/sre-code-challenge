FROM python:3.7-stretch

EXPOSE 5000
ENV FLASK_APP=main.py 

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt
 
RUN useradd appuser
WORKDIR /home/appuser
RUN chown appuser:appuser /home/appuser
USER appuser

COPY --chown=appuser:appuser main.py ./
COPY --chown=appuser:appuser config.py ./

ENTRYPOINT [ "flask" ]
CMD [ "run", "--host=0.0.0.0"] 