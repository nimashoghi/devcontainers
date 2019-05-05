#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM mcr.microsoft.com/dotnet/core/sdk:latest

# Copy endpoint specific user settings into container to specify
# .NET Core should be used as the runtime.
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Install git, process tools
RUN apt-get update && apt-get -y install git procps

# Install PowerShell and set PowerShell as default shell
RUN apt-get update \
    && apt-get install -y curl gnupg apt-transport-https \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list' \
    && apt-get update \
    && apt-get install -y powershell \
    && chsh -s /usr/bin/pwsh root

RUN mkdir /workspace
WORKDIR /workspace

# Install paket
RUN dotnet tool install --global Paket

# Install fake
RUN dotnet tool install --global fake-cli

# Add fsi to PATH
COPY fsi /root/.dotnet/tools/fsi

# Add dotnet tools to PATH
ENV PATH="/root/.dotnet/tools/:${PATH}"

# Fix problems with locale
RUN apt-get update \
    && apt-get install --yes locales \
    && echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "LANG=en_US.UTF-8" > /etc/locale.conf \
    && locale-gen en_US.UTF-8

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
