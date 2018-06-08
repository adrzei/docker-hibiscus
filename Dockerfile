FROM openjdk:8-alpine

ENV HIBISCUS_VERSION=2.8.0

RUN apk update && apk upgrade
RUN apk add wget unzip dos2unix

RUN echo "Europe/Berlin" > /etc/timezone

RUN wget http://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-$HIBISCUS_VERSION.zip
RUN unzip hibiscus-server-$HIBISCUS_VERSION.zip -d / && rm hibiscus-server-$HIBISCUS_VERSION.zip

CMD ["/bin/sh"]

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod 777 /usr/local/bin/docker-entrypoint && dos2unix /usr/local/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]

EXPOSE 8080