FROM python:3.10-alpine

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai'

WORKDIR /app

ADD pandora /app

RUN apk update && apk add tzdata \
    && pip install --upgrade pip \
    && pip install . \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime

VOLUME /app

ENTRYPOINT ["pandora", "-s"]