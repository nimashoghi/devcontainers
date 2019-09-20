FROM clojure:alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache alpine-sdk ca-certificates docker fish git libgcc libstdc++ musl

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
