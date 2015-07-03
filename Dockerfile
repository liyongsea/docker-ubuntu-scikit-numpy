from ubuntu:14.04

COPY requirements.txt /tmp/
WORKDIR /tmp

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
    git

RUN pip install -r requirements.txt
