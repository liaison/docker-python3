FROM node:10-slim

VOLUME ${HOME}/.aws
VOLUME /app
WORKDIR /app

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get install -y python3-pip

RUN apt-get install -y build-essential libssl-dev libffi-dev python3-dev

RUN pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

RUN pip install pandas numpy

RUN npm install -g \
      serverless \
      serverless-python-requirements \
      serverless-domain-manager \
      serverless-aws-documentation

