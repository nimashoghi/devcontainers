FROM python:alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache alpine-sdk bash ca-certificates curl docker git libgcc libstdc++ musl

# Install docker and docker-compose
RUN apk add --no-cache docker libc-dev libffi-dev openssl-dev gcc make py-pip python-dev \
    && pip install docker-compose

# Install Posh
COPY ./install-posh-alpine.sh /tmp/install-posh.sh
RUN chmod +x /tmp/install-posh.sh && /tmp/install-posh.sh && rm /tmp/install-posh.sh

# Upgrade pip
RUN pip install --upgrade pip

# Install build dependencies
RUN apk add --no-cache --update --virtual .build-deps libffi-dev openssl-dev

# Install black
RUN pip install --pre black

# Install jupyter, poetry, pylint
RUN pip install jupyter poetry pylint
COPY ./config.toml /root/.config/pypoetry/config.toml

# Remove build dependencies
RUN apk del .build-deps

# Adjust max user watches config
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
