FROM python:3.8-buster

COPY requirements.txt /tmp/
RUN pip installl --no-cache-dir -r requirements.txt

RUN adduser appuser
WORKDIR /home/appuser
RUN chown appuser:appuser /home/appuser
USER appuser

COPY main.py ./

CMD "flask run"