FROM debian:buster-slim

# install dependencies
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    git \
    gettext \
    libbz2-dev \
    libedit-dev \
    libncurses-dev \
    libreadline-dev \
    zlib1g-dev

# clone repo
WORKDIR /build
RUN git clone https://github.com/fish-shell/fish-shell.git \
    && cd fish-shell \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX="/app" .. \
    && make -j \
    && mkdir /app \
    && make install
