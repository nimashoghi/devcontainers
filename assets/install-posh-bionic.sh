#!/bin/sh

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
dpkg -i packages-microsoft-prod.deb

# Update the list of products
apt-get update

# Enable the "universe" repositories
sudo add-apt-repository universe

# Install PowerShell
apt-get install -y powershell

# Add to shells and set PowerShell as the default shell
echo "/usr/bin/pwsh" | tee -a /etc/shells
sed -i -E "s/^(root:.+):\/.+$/\1:\/usr\/bin\/pwsh/" /etc/passwd

# Adding zsh and zsh completions
sh -c "echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list"
wget -nv https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/xUbuntu_18.04/Release.key -O Release.key
apt-key add - < Release.key
apt-get update
apt-get install --yes zsh zsh-completions
rm Release.key
