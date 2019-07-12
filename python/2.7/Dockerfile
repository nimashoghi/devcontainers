FROM python:2.7-stretch

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Install git, process tools
RUN apt-get update && apt-get -y install git procps

# Install Docker CE CLI
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release \
    && curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | (OUT=$(apt-key add - 2>&1) || echo $OUT) \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce-cli

# Install poetry
RUN pip install --pre poetry \
    && mkdir /root/.config \
    && mkdir /root/.config/pypoetry \
    && touch /root/.config/pypoetry/config.toml \
    && poetry config settings.virtualenvs.create false

# Install Jupyter
RUN pip install jupyter

# Install pylint
RUN pip install pylint

# Install black
RUN pip install autopep8

# Install bandit
RUN pip install bandit

# Install bandit
RUN pip install flake8

RUN mkdir /workspace
WORKDIR /workspace

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
