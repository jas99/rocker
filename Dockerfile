FROM jas99/alpine-glibc
MAINTAINER Jaspreet Singh

RUN apk add --no-cache --update ca-certificates wget tar go &&\
    update-ca-certificates &&\
    wget --quiet --show-progress --progress=bar:force:noscroll https://github.com/grammarly/rocker/releases/download/1.3.0/rocker_linux_amd64.tar.gz &&\
    tar -xvf rocker_linux_amd64.tar.gz --no-same-owner -C /usr/bin &&\
    chmod +x /usr/bin/rocker &&\
    rm rocker_linux_amd64.tar.gz &&\
    export GOPATH=/go &&\
    go get github.com/tonistiigi/buildcache/cmd/buildcache &&\
    apk del --purge --rdepends --clean-protected ca-certificates wget tar go

CMD ["/bin/sh"]