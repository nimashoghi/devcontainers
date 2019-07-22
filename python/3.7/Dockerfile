FROM python:3.7-stretch

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils procps 2>&1

# Install git
RUN apt-get install --yes --no-install-recommends \
    ca-certificate \
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
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release \
    && curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | (OUT=$(apt-key add - 2>&1) || echo $OUT) \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce-cli

# Install poetry
RUN pip install --pre poetry \
    && mkdir /root/.config \
    && mkdir /root/.config/pypoetry \
    && touch /root/.config/pypoetry/config.toml \
    && poetry config settings.virtualenvs.create false

# Install Jupyter
RUN pip install jupyter

# Install pylint
RUN pip install pylint

# Install black
RUN pip install --pre black

# Install mypy
RUN pip install mypy

# Install bandit
RUN pip install bandit

# Install bandit
RUN pip install flake8

RUN mkdir /workspace
WORKDIR /workspace

# Clean up
RUN apt-get autoremove --purge -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
