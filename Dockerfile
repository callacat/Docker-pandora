FROM python:3.10-alpine

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai'

WORKDIR /app

ADD pandora /aqq

RUN pip install --upgrade pip \
    && pip install . \
    && cp /usr/share/zoneinfo-alpine/$TZ /etc/localtime

VOLUME /app

ENTRYPOINT ["pandora", "-s"]