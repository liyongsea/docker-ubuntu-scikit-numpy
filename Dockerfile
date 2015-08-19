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
    libtiff5-dev \
    libjpeg8-dev \
    zlib1g-dev \
    libfreetype6-dev \
    libxft-dev \
    pkg-config \
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
    libncurses5-dev \
    readline

RUN apt-get build-dep -y python-matplotlib
# RUN apt-get install -y supervisor
# RUN mkdir -p /var/log/supervisor
# RUN mkdir -p /etc/supervisor/conf.d
# RUN mkdir -p /supervisor

# supervisor base configuration
# COPY supervisor.conf /etc/supervisor/supervisord.conf
# COPY supervisor.conf /etc/supervisor.conf
# COPY supervisor.conf /etc/supervisord.conf
# RUN service supervisor restart

RUN pip install -r requirements.txt
