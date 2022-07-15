FROM postgres:13-alpine
LABEL maintainer="Jordan Gould <jordangould@gmail.com>"
# Based on https://github.com/andreaswachowski/docker-postgres/blob/master/initdb.sh

ENV PG_JOBMON_VERSION v1.3.3
ENV PG_PARTMAN_VERSION v4.4.0
ENV PG_CRON_VERSION v1.4.1

# Install pg_jobmon
RUN set -ex \
    \
    && apk add --no-cache --virtual .fetch-deps \
        ca-certificates \
        openssl \
        tar \
    \
    && wget -O pg_jobmon.tar.gz "https://github.com/omniti-labs/pg_jobmon/archive/$PG_JOBMON_VERSION.tar.gz" \
    && mkdir -p /usr/src/pg_jobmon \
    && tar \
        --extract \
        --file pg_jobmon.tar.gz \
        --directory /usr/src/pg_jobmon \
        --strip-components 1 \
    && rm pg_jobmon.tar.gz \
    \
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        automake \
        g++ \
        clang \
        llvm \
        libtool \
        libxml2-dev \
        make \
        perl \
    && cd /usr/src/pg_jobmon \
    && make \
    && make install \
    && cd / \
    && rm -rf /usr/src/pg_jobmon

# Install pg_partman
RUN set -ex \
    && wget -O pg_partman.tar.gz "https://github.com/pgpartman/pg_partman/archive/$PG_PARTMAN_VERSION.tar.gz" \
    && mkdir -p /usr/src/pg_partman \
    && tar \
        --extract \
        --file pg_partman.tar.gz \
        --directory /usr/src/pg_partman \
        --strip-components 1 \
    && rm pg_partman.tar.gz \
    && cd /usr/src/pg_partman \
    && make \
    && make install \
    && cd / \
    && rm -rf /usr/src/pg_partman

# Install pg_cron
RUN set -ex \
    && wget -O pg_cron.tar.gz "https://github.com/citusdata/pg_cron/archive/$PG_CRON_VERSION.tar.gz" \
    && mkdir -p /usr/src/pg_cron \
    && tar \
        --extract \
        --file pg_cron.tar.gz \
        --directory /usr/src/pg_cron \
        --strip-components 1 \
    && rm pg_cron.tar.gz \
    && cd /usr/src/pg_cron \
    && export PATH=/usr/pgsql-12/bin:$PATH \
    && make \
    && PATH=$PATH make install \
    && cd / \
    && rm -rf /usr/src/pg_cron

# Clean
RUN apk del .fetch-deps .build-deps    

# Copy the init script
# The Docker Postgres initd script will run anything 
# in the directory /docker-entrypoint-initdb.d
COPY initdb.sh /docker-entrypoint-initdb.d/initdb.sh
