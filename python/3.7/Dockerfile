FROM python:3-alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache bash bash-doc bash-completion ca-certificates docker git libgcc libstdc++ musl \
    && echo 'export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\[\e[m\] \\$ "' > /root/.bashrc \
    && printf "#!/bin/bash\n\ncode-insiders \$@\n" > /usr/local/bin/code \
    && chmod +x /usr/local/bin/code

# Upgrade pip
RUN pip install --upgrade pip

# Install build dependencies
RUN apk add --no-cache --update --virtual .build-deps alpine-sdk libffi-dev openssl-dev

# Install poetry
RUN pip install --pre poetry \
    && mkdir /root/.config \
    && mkdir /root/.config/pypoetry \
    && touch /root/.config/pypoetry/config.toml \
    && poetry config settings.virtualenvs.create false

# Install black, bandit, jupyter, pylint
RUN pip install black bandit jupyter pylint

# Remove build dependencies
RUN apk del .build-deps

# Workspace
RUN mkdir /workspace
WORKDIR /workspace

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
