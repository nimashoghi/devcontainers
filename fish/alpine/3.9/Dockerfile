FROM alpine:3.9 AS builder

# install dependencies
RUN apk add --no-cache \
    alpine-sdk \
    bzip2-dev \
    cmake \
    git \
    gettext-dev \
    libedit-dev \
    ncurses-dev \
    readline-dev \
    zlib-dev

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

FROM alpine:3.9

COPY --from=builder /app/ /app/
COPY --from=builder /root/.config/fish/config.fish /root/.config/fish/config.fish
