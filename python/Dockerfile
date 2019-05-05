#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM python:3

# Copy default endpoint specific user settings overrides into container to specify Python path
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

# Install pylint
RUN pip install pylint

# Install black
RUN pip install black

# Install poetry
RUN pip install --pre poetry \
    && mkdir /root/.config \
    && mkdir /root/.config/pypoetry \
    && touch /root/.config/pypoetry/config.toml \
    && poetry config settings.virtualenvs.in-project true

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
