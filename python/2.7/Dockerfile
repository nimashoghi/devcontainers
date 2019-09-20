FROM python:2-alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache alpine-sdk ca-certificates docker fish git libgcc libstdc++ musl \
    && curl -L https://get.oh-my.fish > /tmp/install \
    && fish /tmp/install --noninteractive \
    && rm /tmp/install \
    && omf install pure

# Upgrade pip
RUN pip install --upgrade pip

# Install build dependencies
RUN apk add --no-cache --update --virtual .build-deps libffi-dev openssl-dev

# Install poetry
RUN pip install --pre poetry
COPY ./config.toml /root/.config/pypoetry/config.toml

# Install autopep8, bandit, jupyter, mypy, pylint
RUN pip install autopep8 bandit jupyter mypy pylint

# Remove build dependencies
RUN apk del .build-deps

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
