#!/bin/sh

# Download the Microsoft repository GPG keys
apt-get update \
&& apt-get install --no-install-recommends --yes ca-certificates wget \
&& wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
dpkg -i packages-microsoft-prod.deb

# Update the list of products
apt-get update

# Install PowerShell
apt-get install -y powershell

# Add to shells and set PowerShell as the default shell
echo "/usr/bin/pwsh" | tee /etc/shells
cat /etc/passwd | sed -E "s/^(root:.+):\/.+$/\1:\/usr\/bin\/pwsh/" > /etc/passwd
