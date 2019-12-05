FROM nimashoghi/fish:alpine-3.10 AS fish
FROM python:3.8-alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache alpine-sdk bash ca-certificates curl docker git libgcc libstdc++ musl

# Install docker and docker-compose
RUN apk add --no-cache docker libc-dev libffi-dev openssl-dev gcc make py-pip python-dev \
    && pip install docker-compose

# Install fish and its dependencies
RUN apk add --no-cache bc bzip2 gettext libedit mdocml-apropos ncurses readline zlib
COPY --from=fish /app/ /usr/local/
# Install config from dotfiles
RUN mkdir -p /root/.config \
    && mkdir -p /root/.config/fish/ \
    && cd /root/.config/fish/ \
    && curl https://raw.githubusercontent.com/nimashoghi/dotfiles/master/.config/fish/config.fish -o config.fish

# Upgrade pip
RUN pip install --upgrade pip

# Install build dependencies
RUN apk add --no-cache --update --virtual .build-deps libffi-dev openssl-dev

# Install poetry
RUN pip install --pre black poetry
COPY ./config.toml /root/.config/pypoetry/config.toml

# Install bandit, jupyter, mypy, pylint
RUN pip install bandit jupyter mypy pylint

# Remove build dependencies
RUN apk del .build-deps

# Adjust max user watches config
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
