FROM node:10.16-alpine

RUN apk update && apk upgrade && apk add curl make gcc build-base wget gnupg alpine-sdk 
RUN set -eux; \
  \
  apk add --no-cache --virtual .build-deps \
    coreutils \
    zlib-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    expat-dev \
    openssl-dev \
      # Equivalent of build essentials
    alpine-sdk 

# Tools we want to keep
RUN apk -U add --no-cache \
      bash \
      git \
      openssh \
      wget \
      file \
      curl \
      nano \
      && \
      rm -rf /var/lib/apt/lists/* && \
      rm /var/cache/apk/*

# Install latest gulp & gulp-cli
# Use npm install [package-name]@[version-number] to install an older version of a package

ENV GULP_CLI_VERSION=${GULP_CLI_VERSION:-2.3.0} \
    GULP_VERSION=${GULP_CLI_VERSION:-4.0.2}

RUN npm install --global gulp-cli@$GULP_CLI_VERSION && \
    npm install -g gulp@$GULP_VERSION

# Change to bash since our folks like bash
SHELL ["/bin/bash", "-c"]

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "node" ]