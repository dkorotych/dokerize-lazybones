FROM openjdk:8-jre-alpine

MAINTAINER Dmitry Korotych, dkorotych at gmail dot com

ENV LAZYBONES_VERSION 0.8.3

ENV APPLICATION_DIR /app

RUN apk add --no-cache openssl bash \
 && cd /usr/local \
 && wget https://dl.bintray.com/pledbrook/lazybones-templates/lazybones-${LAZYBONES_VERSION}.zip \
 && unzip lazybones-${LAZYBONES_VERSION}.zip \
 && ln -s lazybones-${LAZYBONES_VERSION} lazybones \
 && rm lazybones-${LAZYBONES_VERSION}.zip \
 && apk del openssl

ENV PATH /usr/local/lazybones/bin:${PATH}

WORKDIR ${APPLICATION_DIR}
VOLUME ${APPLICATION_DIR}

ENTRYPOINT ["/usr/local/lazybones/bin/lazybones"]
CMD ["help"]