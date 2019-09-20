FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apk add --no-cache alpine-sdk ca-certificates docker fish git libgcc libstdc++ musl \
    && curl -L https://get.oh-my.fish > /tmp/install \
    && fish /tmp/install --noninteractive \
    && rm /tmp/install \
    && fish -c "omf install pure"

# Install paket
RUN dotnet tool install --global Paket

# Install fake
RUN dotnet tool install --global fake-cli

# Add fsi to PATH
COPY fsi /root/.dotnet/tools/fsi
RUN chmod +x /root/.dotnet/tools/fsi

# Add dotnet tools to PATH
ENV PATH="/root/.dotnet/tools/:${PATH}"

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
