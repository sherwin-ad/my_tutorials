#FROM python:3.7-slim
FROM marketplace.gcr.io/google/python:latest
RUN pip install flask
WORKDIR /myapp
COPY main.py /myapp/main.py
CMD ["python", "/myapp/main.py"]
