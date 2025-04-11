#!/bin/sh
set -e

echo "Activating feature 'helix'"

TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked

mkdir -p /home/${_REMOTE_USER}/.config/helix
cp -R runtime /home/${_REMOTE_USER}/.config/helix
chown -R ${_REMOTE_USER}:${_REMOTE_GROUP} /home/${_REMOTE_USER}/.config/helix
cd /
rm -Rf "${TMP_DIR}"

echo "Activated feature 'helix'"