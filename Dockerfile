FROM golang:1.9-alpine

ADD fproxy /go/src/fproxy

RUN sed -i "s/dl-cdn\.alpinelinux\.org/mirrors\.aliyun\.com/" /etc/apk/repositories \
    && apk add --update \
    git \
    && go-wrapper download \
    github.com/kardianos/govendor \
    && go-wrapper install \
    github.com/kardianos/govendor \
    && cd /go/src/fproxy \
    && govendor install +local ./vendor/github.com/fancl20/fproxy

ENTRYPOINT ["/go/bin/fproxy"]
