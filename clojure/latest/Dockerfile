FROM clojure:alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache ca-certificates bash bash-doc bash-completion libgcc libstdc++ musl \
    && echo 'export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\[\e[m\] \\$ "' > /root/.bashrc

# Install git
RUN apk add --no-cache git

# Install Docker CE CLI
RUN apk add --no-cache docker

# Workspace
RUN mkdir /workspace
WORKDIR /workspace

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
