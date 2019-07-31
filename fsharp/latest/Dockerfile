FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache bash bash-doc bash-completion ca-certificates docker git libgcc libstdc++ musl \
    && echo 'export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\[\e[m\] \\$ "' > /root/.bashrc \
    && printf "#!/bin/bash\n\ncode-insiders \$@\n" > /usr/local/bin/code \
    && chmod +x /usr/local/bin/code

# Install paket
RUN dotnet tool install --global Paket

# Install fake
RUN dotnet tool install --global fake-cli

# Add fsi to PATH
COPY fsi /root/.dotnet/tools/fsi

# Add dotnet tools to PATH
ENV PATH="/root/.dotnet/tools/:${PATH}"

# Workspace
RUN mkdir /workspace
WORKDIR /workspace

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
