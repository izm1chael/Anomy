#!/usr/bin/env bash

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" >&2
  exit 1
fi

PKG_MANAGER=""
if command -v apt-get >/dev/null 2>&1; then
  PKG_MANAGER="apt"
elif command -v yum >/dev/null 2>&1; then
  PKG_MANAGER="yum"
elif command -v dnf >/dev/null 2>&1; then
  PKG_MANAGER="dnf"
else
  echo "No supported package manager found (apt, yum, dnf)" >&2
  exit 1
fi

package_installed() {
  case $PKG_MANAGER in
    apt)
      dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -q "ok installed"
      ;;
    yum|dnf)
      rpm -q "$1" >/dev/null 2>&1
      ;;
  esac
}

install_package() {
  case $PKG_MANAGER in
    apt) apt-get install -y "$1" ;;
    yum) yum install -y "$1" ;;
    dnf) dnf install -y "$1" ;;
  esac
}

echo "Checking if tor is installed"
sleep 5
if package_installed tor; then
  echo "Tor is already installed"
else
  echo "Installing Tor"
  install_package tor
fi

echo "Checking if Torsocks is installed"
sleep 5
if package_installed torsocks; then
  echo "Torsocks is already installed"
else
  echo "Installing Torsocks"
  install_package torsocks
fi

install -m 755 anomy.sh /usr/local/bin/anomy
