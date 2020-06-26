#!/bin/sh

set -e

# Add to shells and set PowerShell as the default shell
echo "/usr/bin/pwsh" | tee -a /etc/shells
sed -i -E "s/^(root:.+):\/.+$/\1:\/usr\/bin\/pwsh/" /etc/passwd

# Adding zsh and zsh completions
apk add --no-cache zsh
cd /root
git clone https://github.com/zsh-users/zsh-completions.git .zsh-completions/
echo 'fpath=(/root/.zsh-completions/src $fpath); autoload -Uz compinit; compinit' >> /root/.zshrc
rm -f /root/.zcompdump
zsh -c "autoload -Uz compinit; compinit"
