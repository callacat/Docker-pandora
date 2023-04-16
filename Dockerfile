FROM python:3.10-alpine

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai' 

# WORKDIR /app

ADD pandora /tmp

RUN cd /tmp && apk update && apk add --no-cache tzdata \
    && pip install --upgrade pip && pip install 'pandora-chatgpt[api]' \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apk del tzdata \
    && rm -rf /tmp/* /var/cache/apk/* 

ENTRYPOINT ["pandora"]