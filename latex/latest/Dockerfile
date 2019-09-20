FROM alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache alpine-sdk ca-certificates docker fish git libgcc libstdc++ musl \
    && curl -L https://get.oh-my.fish | fish \
    && omf install pure

# Install LaTeX
RUN apk add --no-cache biber make texlive-full

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
