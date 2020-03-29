FROM alpine:latest

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

# Install LaTeX
RUN apk add --no-cache biber make texlive-full

# Install other necessary packages
RUN apk add --no-cache perl-log-dispatch perl-yaml-tiny
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ perl-file-homedir

# Adjust max user watches config
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
