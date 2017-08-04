FROM index.xxxxx.com/library/node:4.2

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.5
ENV CONFD_VERSION 0.10.0
ENV GOREMAN_VERSION 0.0.7

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/* \
  && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
  && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
  && gpg --verify /usr/local/bin/gosu.asc \
  && rm /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu \
  && curl -o /usr/local/bin/confd -SL "https://github.com/kelseyhightower/confd/releases/download/v$CONFD_VERSION/confd-$CONFD_VERSION-linux-$(dpkg --print-architecture)" \
  && chmod +x /usr/local/bin/confd \
  && curl -SL "https://github.com/mattn/goreman/releases/download/v$GOREMAN_VERSION/goreman_linux_$(dpkg --print-architecture).tar.gz" | tar zxvf - -C /tmp/ \
  && cp /tmp/goreman_linux_$(dpkg --print-architecture)/goreman /usr/local/bin/ \
  && chmod +x /usr/local/bin/goreman && rm -rf /tmp/goreman_linux_$(dpkg --print-architecture) \
  && apt-get purge -y --auto-remove curl

RUN mkdir -p /etc/confd/conf.d && mkdir -p /etc/confd/templates

# install libmemcached-dev
RUN apt-get update && apt install -y libmemcached-dev && rm -rf /var/lib/apt/lists/*

# make the "en_US.UTF-8" locale so www will be utf-8 enabled by default
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.UTF-8


ENV NPM_CONFIG_REGISTRY http://npm-lazy.xxxxx.com
ENV SASS_BINARY_SITE http://archive.xxxxx.com/sass/node-sass

# Install pm2 for managing Procfile-based applications
RUN npm update -g npm && npm install -g pm2 && npm install -g gulp

RUN mkdir /docker-entrypoint-init.d
COPY docker-entrypoint.sh /

EXPOSE 5000

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["goreman", "start"]

