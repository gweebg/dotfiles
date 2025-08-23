#!/usr/bin/env bash

set -e

TAR_FILE="Bibata.tar.xz"
REPO_URL="https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/$TAR_FILE"

install_theme() {
    local scope=$1
    echo "downloading bibata cursor theme from $REPO_URL..."
    curl -L -o "$TAR_FILE" "$REPO_URL"

    echo "extracting $TAR_FILE..."
    tar -xvf "$TAR_FILE"

    if [ "$scope" = "local" ]; then
        mkdir -p $HOME/.local/share/icons/
        mv Bibata-* $HOME/.local/share/icons/
        echo "✅ installed bibata cursor theme locally"
    elif [ "$scope" = "system" ]; then
        sudo mv Bibata-* /usr/share/icons/
        echo "✅ installed bibata cursor theme system-wide."
    else
        echo "❌ invalid scope: $scope"
        exit 1
    fi

    rm -f "$TAR_FILE" LICENSE
}

uninstall_theme() {
    local scope=$1
    if [ "$scope" = "local" ]; then
        rm -rf $HOME/.local/share/icons/Bibata-*
        echo "✅ uninstalled bibata cursor theme locally."
    elif [ "$scope" = "system" ]; then
        sudo rm -rf /usr/share/icons/Bibata-*
        echo "✅ uninstalled bibata cursor theme system-wide."
    else
        echo "❌ invalid scope: $scope"
        exit 1
    fi
}

show_help() {
    echo "Usage: $0 {install|uninstall} {local|system}"
    echo
    echo "Scopes:"
    echo "     local  - installs to $HOME/.local/share/icons/"
    echo "     system - installs to /usr/share/icons/"
    echo 
    echo "Examples:"
    echo "  $0 install local    # Install Bibata theme for current user"
    echo "  $0 install system   # Install Bibata theme system-wide"
    echo "  $0 uninstall local  # Uninstall Bibata theme for current user"
    echo "  $0 uninstall system # Uninstall Bibata theme system-wide"
}

if [ $# -ne 2 ]; then
    show_help
    exit 1
fi

ACTION=$1
SCOPE=$2

case "$ACTION" in
    install)
        install_theme "$SCOPE"
        ;;
    uninstall)
        uninstall_theme "$SCOPE"
        ;;
    *)
        show_help
        exit 1
        ;;
esac

