#!/bin/sh
set -e

echo "Activating feature 'lima-vm'"

TMP_DIR=$(mktemp)
mkdir "${TMP_DIR}"
cd "${TMP_DIR}"
git clone https://github.com/lima-vm/lima
cd lima
make
make install
cd /
rm -Rf "${TMP_DIR}"

echo "Activated feature 'lima-vm'"