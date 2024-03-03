FROM python:3.13.0a3-slim

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai' 

WORKDIR /app

ADD pandora /app

RUN apt-get update && apt-get install -y --no-install-recommends tzdata \
    && pip install --upgrade pip && pip install '.[api]' \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt-get remove -y tzdata && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["pandora"]
