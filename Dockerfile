FROM mhart/alpine-node:5.8.0

MAINTAINER Trevor Hartman <trevorhartman@gmail.com>

RUN apk update && \
    apk add git

RUN npm install git2consul@0.12.11 --global

EXPOSE 5252/tcp

VOLUME ["/repo"]

CMD ["-e", "consul.service.consul"]

ENTRYPOINT ["/usr/bin/node","/usr/lib/node_modules/git2consul","-h"]
