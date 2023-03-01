FROM python:3.10-alpine

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai'

WORKDIR /app

ADD ./pandora .

RUN pip install . \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime

VOLUME /app

ENTRYPOINT ["pandora", "-s"]