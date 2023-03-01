FROM python:3.10-alpine

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai'

WORKDIR /app

COPY pandora /app

RUN apk update \
    && apk add --no-cache tzdata \
    && pip install --upgrade pip \
    && pip install . \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \

ENTRYPOINT ["pandora", "-s"]