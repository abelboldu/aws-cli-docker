FROM alpine:latest

ENV CLI_VERSION=1.11.116

RUN mkdir -p /aws && \
    apk -Uuv add groff jq less python py-pip git bash && \
    pip install awscli==$CLI_VERSION && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

ADD ecs-deploy /usr/local/bin/ecs-deploy

WORKDIR /aws
