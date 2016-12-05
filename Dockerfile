FROM ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y install wget curl gcc make libssl-dev mysql-client sqlite3 libsqlite3-dev

# Python のインストール
RUN wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz && \
    tar -xf Python-3.5.2.tgz && \
    cd Python-3.5.2 && \
    ./configure && make && make install && \
    cp ./python /usr/bin/ && \
    cd / && rm -rf Python-*

# pip 周りのインストール
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python && \
    pip install django gunicorn

# Nginx のインストール
RUN apt-get -y install nginx

ADD . /app

EXPOSE 3000
