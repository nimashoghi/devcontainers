FROM nimashoghi/fish:slim-buster as fish
FROM node:lts-buster-slim

# Make debian non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Fix locale issues
RUN apt-get update \
    && apt-get install --no-install-recommends --yes locales \
    && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apt-get update \
    && apt-get install --no-install-recommends --yes \
    apt-transport-https build-essential ca-certificates curl git gnupg2 libssl-dev libffi-dev software-properties-common wget

# Install docker and docker-compose
RUN curl -fsSL https://get.docker.com | sh \
    && curl -L https://github.com/docker/compose/releases/download/1.25.1-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Install fish and its dependencies
RUN apt-get update \
    && apt-get install --yes --no-install-recommends bc bzip2 gettext libeditline0 libreadline7 libncurses5 zlib1g
COPY --from=fish /app/ /usr/local/

# Install config from dotfiles
RUN mkdir -p /root/.config \
    && mkdir -p /root/.config/fish/ \
    && cd /root/.config/fish/ \
    && curl https://raw.githubusercontent.com/nimashoghi/dotfiles/master/.config/fish/config.fish -o config.fish

# Install eslint, jest, prettier, and typescript
RUN npm install --global eslint jest prettier typescript

# Clear apt cache
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Adjust max user watches config
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
