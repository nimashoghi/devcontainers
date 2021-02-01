FROM python:2-slim

# make debian non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Fix locale issues
RUN apt-get update \
    && apt-get install --no-install-recommends --yes locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt and install necessary libraries
RUN apt-get update \
    && apt-get install --no-install-recommends --yes \
    apt-transport-https build-essential ca-certificates curl git gnupg2 procps software-properties-common wget

# Install docker and docker-compose
RUN curl -fsSL https://get.docker.com | sh \
    && pip install docker-compose

# Install Posh
COPY ./install-posh-buster.sh /tmp/install-posh.sh
RUN chmod +x /tmp/install-posh.sh && /tmp/install-posh.sh && rm /tmp/install-posh.sh

# Upgrade pip
RUN pip install --upgrade pip

# Install autopep8, bandit, jupyter, poetry, pylint
RUN pip install autopep8 jupyter poetry pylint
COPY ./jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Clear apt cache
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Adjust max user watches config
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

# Wait forever
CMD /bin/sh -c "while sleep 1000; do :; done"
