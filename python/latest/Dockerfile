FROM python:3-alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache ca-certificates bash bash-doc bash-completion libgcc libstdc++ musl \
    && echo 'export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\[\e[m\] \\$ "' > /root/.bashrc

# Upgrade pip
RUN pip install --upgrade pip

# Install build dependencies
RUN apk add --no-cache --update --virtual .build-deps alpine-sdk libffi-dev openssl-dev

# Install git
RUN apk add --no-cache git

# Install Docker CE CLI
RUN apk add --no-cache docker

# Install poetry
RUN pip install --pre poetry \
    && mkdir /root/.config \
    && mkdir /root/.config/pypoetry \
    && touch /root/.config/pypoetry/config.toml \
    && poetry config settings.virtualenvs.create false

# Install jupyter
RUN pip install jupyter

# Install pylint
RUN pip install pylint

# Install black
RUN pip install black

# Install bandit
RUN pip install bandit

# Remove build dependencies
RUN apk del .build-deps

# Workspace
RUN mkdir /workspace
WORKDIR /workspace

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
