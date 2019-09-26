FROM debian:buster-slim as builder

# install dependencies
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
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

# copy config
COPY ./config.fish /root/.config/fish/config.fish

FROM debian:buster-slim

COPY --from=builder /app/ /app/
COPY --from=builder /root/.config/fish/config.fish /root/.config/fish/config.fish
