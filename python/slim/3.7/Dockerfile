FROM python:3.7-slim

# make debian non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apt-get update \
    && apt-get install --no-install-recommends --yes \
    apt-transport-https build-essential ca-certificates curl git gnupg2 libssl-dev libffi-dev software-properties-common wget

# Install Docker
RUN curl -fsSL https://get.docker.com | sh

# Install fish
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish/Debian_9.0/ /' > /etc/apt/sources.list.d/shells:fish.list \
    && wget -nv https://download.opensuse.org/repositories/shells:fish/Debian_9.0/Release.key -O Release.key \
    && apt-key add - < Release.key \
    && apt-get update \
    && apt-get install --no-install-recommends --yes fish \
    && curl -L https://get.oh-my.fish > /tmp/install \
    && fish /tmp/install --noninteractive \
    && rm /tmp/install \
    && fish -c "omf install pure" \
    && ln -s ~/.local/share/omf/themes/pure/conf.d/pure.fish ~/.config/fish/conf.d/pure.fish \
    && ln -s ~/.local/share/omf/themes/pure/conf.d/_pure_init.fish ~/.config/fish/conf.d/pure_init.fish

# Upgrade pip
RUN pip install --upgrade pip

# Install poetry
RUN pip install --pre black poetry
COPY ./config.toml /root/.config/pypoetry/config.toml

# Install bandit, jupyter, mypy, pylint
RUN pip install bandit jupyter mypy pylint

# Clear apt cache
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Adjust max user watches config
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
