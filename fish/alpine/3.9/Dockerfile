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
    && git reset --hard 8acff328e0f249ec01b1fe2a28f41de5e6129e5b \
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
