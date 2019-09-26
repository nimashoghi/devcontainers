FROM nimashoghi/fish:slim-buster as fish
FROM python:3.7-slim

# make debian non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apt-get update \
    && apt-get install --no-install-recommends --yes \
    apt-transport-https build-essential ca-certificates curl git gnupg2 libssl-dev libffi-dev software-properties-common wget

# Install docker and docker-compose
RUN curl -fsSL https://get.docker.com | sh \
    && pip install docker-compose

# Install fish, oh-my-fish, and pure theme
COPY --from=fish /app/ /usr/local/
COPY --from=fish /root/.config/fish/config.fish /root/.config/fish/config.fish
RUN apk add --no-cache bc bzip2 gettext libedit mdocml-apropos ncurses readline zlib \
    && curl -L https://get.oh-my.fish > /tmp/install-omf \
    && fish /tmp/install-omf --noninteractive \
    && rm /tmp/install-omf \
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
