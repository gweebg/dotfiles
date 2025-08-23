#!/usr/bin/env bash

set -e

VERSION="2.4.1"
PKG_NAME="adwaita-colors-theme-${VERSION}.rpm"
REPO_URL="https://github.com/dpejoh/Adwaita-colors/releases/download/v${VERSION}/${PKG_NAME}"

install_theme() {
    echo "downloading Adwaita-colors theme..."
    wget -O "$PKG_NAME" "$REPO_URL"

    echo "installing Adwaita-colors theme..."
    sudo dnf install -y "$PKG_NAME"

    echo "installed Adwaita-colors theme."
}

uninstall_theme() {
    echo "removing Adwaita-colors theme..."
    sudo dnf remove -y adwaita-colors-theme

    echo "uninstalled Adwaita-colors theme."
}

show_help() {
    echo "Usage: $0 {install|uninstall}"
    echo
    echo "Examples:"
    echo "  $0 install    # Install Adwaita-colors theme"
    echo "  $0 uninstall  # Uninstall Adwaita-colors theme"
}

if [ $# -ne 1 ]; then
    show_help
    exit 1
fi

ACTION=$1

case "$ACTION" in
    install)
        install_theme
        ;;
    uninstall)
        uninstall_theme
        ;;
    *)
        show_help
        exit 1
        ;;
esac

