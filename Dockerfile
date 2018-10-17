FROM node:10-alpine

VOLUME ${HOME}/.aws
VOLUME /app
WORKDIR /app

RUN apk add --update curl gcc g++

RUN apk add --no-cache python3 python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

RUN apk upgrade --update-cache --available \
    && apk update \
    && apk add --no-cache \
      ca-certificates \
      git \
    && npm install -g \
      serverless \
      serverless-python-requirements \
      serverless-domain-manager \
      serverless-aws-documentation


