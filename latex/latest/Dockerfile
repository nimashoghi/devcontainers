FROM debian:stretch

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Install git, process tools
RUN apt-get update && apt-get -y install git procps

# Install LaTeX
RUN apt-get install -y \
    biber \
    latexmk \
    make \
    texlive-full

RUN mkdir /workspace
WORKDIR /workspace

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
