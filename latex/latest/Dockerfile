FROM debian:stretch
ARG GIT_VERSION=2.22.0

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json


# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils ca-certificates procps 2>&1

# Install git
RUN apt-get install --yes --no-install-recommends \
    gettext \
    libssl-dev \
    libghc-zlib-dev \
    libcurl4-gnutls-dev \
    libexpat1-dev \
    make \
    unzip \
    wget \
    && cd /tmp \
    && wget --no-verbose https://github.com/git/git/archive/v${GIT_VERSION}.zip \
    && unzip -qq v${GIT_VERSION}.zip \
    && cd git-${GIT_VERSION} \
    && make -j prefix=/usr/local all \
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
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install LaTeX
RUN apt-get install -y \
    biber \
    latexmk \
    make \
    texlive-full

RUN mkdir /workspace
WORKDIR /workspace

# Clean up
RUN apt-get autoremove --purge -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
