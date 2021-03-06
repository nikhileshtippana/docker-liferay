FROM openjdk:8
MAINTAINER Nikhilesh Tippana <nikhilesh.nike@gmail.com>

RUN apt-get update \
  && apt-get install -y curl tree \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && useradd -ms /bin/bash liferay

ENV LIFERAY_HOME=/usr/local/liferay-ce-portal-7.0-ga5
ENV LIFERAY_SHARED=/storage/liferay
ENV LIFERAY_WEB_SERVER_PROTOCOL=https
ENV LIFERAY_CONFIG_DIR=/tmp/liferay/configs
ENV LIFERAY_DEPLOY_DIR=/tmp/liferay/deploy
ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-8.0.32
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV LIFERAY_TOMCAT_URL=https://sourceforge.net/projects/lportal/files/Liferay%20Portal/7.0.4%20GA5/liferay-ce-portal-tomcat-7.0-ga5-20171018150113838.zip/download
ENV GOSU_VERSION 1.10
ENV GOSU_URL=https://github.com/tianon/gosu/releases/download/$GOSU_VERSION

WORKDIR /usr/local

RUN mkdir -p "$LIFERAY_HOME" \
      && set -x \
      && curl -fSL "$LIFERAY_TOMCAT_URL" -o liferay-ce-portal-tomcat-7.0-ga5-20171018150113838.zip \
      && unzip liferay-ce-portal-tomcat-7.0-ga5-20171018150113838.zip \
      && rm liferay-ce-portal-tomcat-7.0-ga5-20171018150113838.zip \
      && chown -R liferay:liferay $LIFERAY_HOME

COPY ./entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8080/tcp
EXPOSE 11311/tcp

VOLUME /storage

ENTRYPOINT ["entrypoint.sh"]
CMD ["catalina.sh", "run"]