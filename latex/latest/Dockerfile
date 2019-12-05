FROM nimashoghi/fish:alpine-3.10 AS fish
FROM alpine

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

# Install LaTeX
RUN apk add --no-cache biber make texlive-full

# Install other necessary packages
RUN apk add --no-cache perl-log-dispatch perl-yaml-tiny
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ perl-file-homedir

# Adjust max user watches config
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
