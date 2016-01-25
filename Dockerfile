FROM python:2.7.11

RUN echo "deb http://ftp.au.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.au.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update --fix-missing && apt-get install -y \
	gdal-bin \
	ca-certificates curl gcc libc6-dev make \
	bzr git \
	python-dev \
	zip \
	--no-install-recommends

# build dependencies for postgres and image bindings
RUN apt-get build-dep -y \
    python-psycopg2

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

RUN pip install awscli awsebcli

VOLUME /root/.aws
