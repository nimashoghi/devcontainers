FROM alpine:3.9

# install dependencies
RUN apk add --no-cache \
    alpine-sdk \
    bzip2-dev \
    cmake \
    curl \
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

# Install config from dotfiles
RUN mkdir -p /root/.config \
    && mkdir -p /root/.config/fish/ \
    && cd /root/.config/fish/ \
    && curl https://raw.githubusercontent.com/nimashoghi/dotfiles/master/.config/fish/config.fish -o config.fish
