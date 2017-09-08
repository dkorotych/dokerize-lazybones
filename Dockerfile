FROM openjdk:7-jre-alpine

MAINTAINER Dmitry Korotych, dkorotych@gmail.com

RUN apk add --no-cache curl bash zip unzip
SHELL ["/bin/bash", "-c", "-l"]

ENV LAZYBONES_VERSION 0.8.3

ENV GROUP_NAME lazybones
ENV USER_NAME lazybones
ENV USER_HOME /home/${USER_NAME}
ENV APPLICATION_DIR ${USER_HOME}/app

RUN addgroup "${GROUP_NAME}" \
 && adduser -s /bin/bash -D -G "${GROUP_NAME}" "${USER_NAME}" \
 && mkdir "${APPLICATION_DIR}" \
 && chown -R "${GROUP_NAME}:${USER_NAME}" "${USER_HOME}"

USER ${USER_NAME}
RUN curl -s "https://get.sdkman.io" | /bin/bash
RUN source "${USER_HOME}/.sdkman/bin/sdkman-init.sh" \
 && sdk install lazybones ${LAZYBONES_VERSION} \
 && sdk flush archives \
 && sdk flush broadcast \
 && sdk flush candidates \
 && sdk flush temp

COPY entrypoint.sh /
ENV PATH ${USER_HOME}/.sdkman/candidates/lazybones/${LAZYBONES_VERSION}/bin:${PATH}
WORKDIR ${APPLICATION_DIR}
VOLUME ["${APPLICATION_DIR}"]

USER root
RUN chmod +x /entrypoint.sh

USER ${USER_NAME}
ENTRYPOINT ["/entrypoint.sh"]