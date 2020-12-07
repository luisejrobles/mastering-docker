FROM alpine:latest
LABEL maintainer="Luis Jiménez"
LABEL description="Dockerfile to run NGINX in a container"

RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /tmp/nginx/

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
ADD luisejrobles-github-io.zip /usr/share/nginx/

EXPOSE 80/tcp

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off"]

