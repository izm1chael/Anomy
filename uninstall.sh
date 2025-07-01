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

remove_package() {
  case $PKG_MANAGER in
    apt) apt-get purge -y "$1" ;;
    yum) yum remove -y "$1" ;;
    dnf) dnf remove -y "$1" ;;
  esac
}

echo "Removing Anomy and its dependencies"
sleep 5

echo "Checking if Tor is installed"
if package_installed tor; then
  echo "Removing Tor"
  remove_package tor
else
  echo "Tor is not currently installed"
fi

echo "Checking if Torsocks is installed"
sleep 5
if package_installed torsocks; then
  echo "Removing Torsocks"
  remove_package torsocks
else
  echo "Torsocks is not currently installed"
fi

rm -f /usr/local/bin/anomy
