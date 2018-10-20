FROM debian:stretch-slim
MAINTAINER Varun Madiath <vamega@gmail.com>

COPY files/ /

RUN apt-get update && \
    apt-get -y install \
        curl \
        gnupg2 \
        rubygems-integration \
        ruby-dev \
        ruby \
        build-essential \
        rsync \
        dpkg-sig \
        apt-transport-https \
        scrypt \
        jfrog-cli  \
        # Python packaging dependencies
        python \
        python-setuptools \
        python-pip \
        && \
    apt-get -y dist-upgrade && \
    apt-get clean && \
    rm -f /var/lib/apt/lists/* ; \
    rm -f /var/lib/apt/lists/partial/*

RUN gem install fpm
