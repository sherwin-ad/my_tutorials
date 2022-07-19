FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y python python3-pip
RUN pip install flask

COPY app.py /opt/app.py

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0