#!/bin/sh
set -e

echo "Activating feature 'helix'"

VERSION=${VERSION:-25.01.1}
ARCH=$(uname -m)
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
PKG=helix-${VERSION}-${ARCH}-${OS}

mkdir /tmp/helix-install
cd /tmp/helix-install
curl -LO "https://github.com/helix-editor/helix/releases/download/${VERSION}/${PKG}.tar.xz"
tar xJf "${PKG}.tar.xz"
mv "${PKG}/hx" /usr/local/bin/
mkdir -p /home/${_REMOTE_USER}/.config/helix
mv "${PKG}/runtime" /home/${_REMOTE_USER}/.config/helix
chown -R ${_REMOTE_USER}:${_REMOTE_GROUP} /home/${_REMOTE_USER}/.config/helix
rm -Rf /tmp/helix-install

echo "Activated feature 'helix'"