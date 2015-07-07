from ubuntu:14.04

COPY requirements.txt /tmp/
WORKDIR /tmp
MAINTAINER CathoLabs catholabs@catho.com
ENV DEBIAN_FRONTEND noninteractive


# enable the universe
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN apt-get -y update && apt-get install -y \
    mysql-client \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    libmysqlclient* \
    python2.7 \
    python-dev \
    python-pip \
    tmux \
    curl \
    nano \
    vim \
    git \
    htop \
    man \
    software-properties-common \
    unzip \
    wget \
    supervisor

RUN mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d \
    mkdir -p /supervisor

# supervisor base configuration
COPY supervisor.conf /etc/supervisor/supervisord.conf
COPY supervisor.conf /etc/supervisor.conf
COPY supervisor.conf /etc/supervisord.conf

RUN service supervisor restart

RUN pip install -r requirements.txt
