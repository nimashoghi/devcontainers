FROM python:3.8-alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache alpine-sdk bash ca-certificates docker git libgcc libstdc++ musl

# Install docker and docker-compose
RUN apk add --no-cache docker libc-dev libffi-dev openssl-dev gcc make py-pip python-dev \
    && pip install docker-compose

# Install fish, oh-my-fish, and pure theme
RUN apk add --no-cache fish \
    && curl -L https://get.oh-my.fish > /tmp/install \
    && fish /tmp/install --noninteractive \
    && rm /tmp/install \
    && fish -c "omf install pure" \
    && ln -s ~/.local/share/omf/themes/pure/conf.d/pure.fish ~/.config/fish/conf.d/pure.fish \
    && ln -s ~/.local/share/omf/themes/pure/conf.d/_pure_init.fish ~/.config/fish/conf.d/pure_init.fish

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
