FROM debian:stretch-slim
MAINTAINER Varun Madiath <vamega@gmail.com>

RUN echo "deb http://dl.bintray.com/vamega/personal-debian-server stretch main" > \
    /etc/apt/sources.list.d/personal-debian-server.list

RUN apt-get update && \
    apt-get -y install \
        apt-transport-https \
        curl \
        gnupg2 \
        rubygems-integration \
        ruby-dev \
        ruby \
        build-essential \
        rsync \
        dpgk-sig && \
    apt-get -y dist-upgrade && \
    apt-get clean && \
    rm -f /var/lib/apt/lists/* ; \
    rm -f /var/lib/apt/lists/partial/*
RUN gem install fpm

# Python packaging dependencies
RUN apt-get update && \
    apt-get -y install \
        python \
        python-setuptools \
        python-pip \
        && \
    apt-get -y dist-upgrade && \
    apt-get clean && \
    rm -f /var/lib/apt/lists/* ; \
    rm -f /var/lib/apt/lists/partial/*