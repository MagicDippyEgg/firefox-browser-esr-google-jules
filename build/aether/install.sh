#!/usr/bin/env bash
set -e

INSTALL_DIR="/opt/aether"
DESKTOP_DIR="/usr/share/applications"

echo "Installing Aether Browser..."

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (e.g. sudo ./install.sh)"
  return 1 2>/dev/null || (echo "Not root" && false)
fi

mkdir -p "$INSTALL_DIR"
cp -r aether/* "$INSTALL_DIR/"

mkdir -p "$DESKTOP_DIR"
cp aether.desktop "$DESKTOP_DIR/"

ln -sf "$INSTALL_DIR/aether" /usr/local/bin/aether

echo "Aether Browser installed successfully!"
