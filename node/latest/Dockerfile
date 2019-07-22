FROM node:latest

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils procps 2>&1

# Install git
RUN apt-get install --yes --no-install-recommends \
    ca-certificates \
    gettext \
    libssl-dev \
    libghc-zlib-dev \
    libcurl4-gnutls-dev \
    libexpat1-dev \
    make \
    unzip \
    wget \
    && cd /tmp \
    && wget https://github.com/git/git/archive/v${GIT_VERSION}.zip \
    && unzip v${GIT_VERSION}.zip \
    && cd git-${GIT_VERSION} \
    && make prefix=/usr/local all \
    && make prefix=/usr/local install \
    && rm /tmp/v${GIT_VERSION}.zip \
    && rm -rf /tmp/git-${GIT_VERSION} \
    && apt-get remove --purge --yes --no-install-recommends \
    gettext \
    libssl-dev \
    libghc-zlib-dev \
    libcurl4-gnutls-dev \
    libexpat1-dev \
    make \
    unzip \
    wget

# Fix locale problems
RUN apt-get install -y --no-install-recommends locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install Docker CE CLI
RUN apt-get install -y apt-transport-https curl gnupg-agent software-properties-common lsb-release \
    && curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | (OUT=$(apt-key add - 2>&1) || echo $OUT) \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce-cli

# Remove outdated yarn from /opt and install via package
# so it can be easily updated via apt-get upgrade yarn
RUN rm -rf /opt/yarn-* \
    && rm -f /usr/local/bin/yarn \
    && rm -f /usr/local/bin/yarnpkg \
    && apt-get install -y curl apt-transport-https lsb-release \
    && curl -sS https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/pubkey.gpg | apt-key add - 2>/dev/null \
    && echo "deb https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends yarn

# Install tslint and typescript
RUN npm install --global eslint prettier typescript

# Clean up
RUN apt-get autoremove --purge -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog
