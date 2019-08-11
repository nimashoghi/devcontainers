FROM node:current-buster

ARG COMPOSE_VERSION=1.25.0-rc2

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apt-get update && apt-get install --yes --no-install-recommends \
    apt-utils \
    build-essential  \
    ca-certificates \
    procps

# Install Docker CE CLI
RUN apt-get install --yes apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release \
    && curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | (OUT=$(apt-key add - 2>&1) || echo $OUT) \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install --yes docker-ce-cli


# Install Docker Compose
RUN curl -sSL "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Install eslint, prettier, jest, and typescript
RUN npm install --global eslint jest prettier typescript

# Clean up apt
RUN apt-get autoremove --yes \
    && apt-get clean --yes \
    && rm -rf /var/lib/apt/lists/*

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
