FROM golang:1.9-alpine

RUN sed -i "s/dl-cdn\.alpinelinux\.org/mirrors\.aliyun\.com/" /etc/apk/repositories \
    && apk add --update \
    git \
    && go-wrapper download \
    github.com/fancl20/fproxy \
    && go-wrapper install \
    github.com/fancl20/fproxy

ENTRYPOINT ["/go/bin/fproxy"]
