#!/usr/bin/env bash

PKGS=(
    zoxide
    fish
    docker
    git
    gitui
    pre-commit
    direnv
    tldr
    fd-find
    fzf
)

error() {
    echo "error: $*" >&2
    exit 1
}

install_dnf_packages() {
    echo "updating dnf..."
    sudo dnf -y update || error "dnf update failed"

    echo "installing packages: ${PKGS[*]}"
    sudo dnf -y install "${PKGS[@]}" || error "failed to install base packages"
}

enable_services() {
    echo "enabling docker..."
    sudo systemctl enable --now docker || error "failed to enable docker"
    sudo usermod -aG docker $USER || error "failed to add $USER to docker group"
}

install_dnf_packages
install_asdf
enable_services

echo "done. installed: ${PKGS[*]}"
