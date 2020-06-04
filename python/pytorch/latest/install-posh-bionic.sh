#!/bin/sh

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
dpkg -i packages-microsoft-prod.deb

# Update the list of products
apt-get update

# Enable the "universe" repositories
add-apt-repository universe

# Install PowerShell
apt-get install -y powershell

# Add to shells and set PowerShell as the default shell
echo "/usr/bin/pwsh" | tee -a /etc/shells
sed -i -E "s/^(root:.+):\/.+$/\1:\/usr\/bin\/pwsh/" /etc/passwd

# Adding zsh and zsh completions
apt update
apt install --yes zsh
cd /root
git clone https://github.com/zsh-users/zsh-completions.git .zsh-completions/
echo 'fpath=(/root/.zsh-completions/src $fpath); autoload -Uz compinit; compinit' >> /root/.zshrc
rm -f /root/.zcompdump
zsh -c "autoload -Uz compinit; compinit"
