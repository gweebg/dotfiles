#!/usr/bin/env bash

REPO="https://github.com/ryanoasis/nerd-fonts.git"
INSTALL_DIR="$HOME/.nerd-fonts"
SPACE_PER_FONT_MB=300

FONTS=("CascadiaCode" "CodeNewRoman" "DejaVuSansMono" "FiraCode" "FiraMono" "Hack" "Iosevka" "JetBrainsMono" "NerdFontsSymbolsOnly" "Noto" "Ubuntu" "UbuntuMono")

error() {
    echo "error: $*" >&2
    exit 1
}

check_space() {
    local required=$(( ${#FONTS[@]} * SPACE_PER_FONT_MB ))
    local available
    available=$(df -m "$HOME" | awk 'NR==2 {print $4}') || error "failed to check available disk space"

    echo "required (aprox.): ${required}MB, available: ${available}MB"
    if (( available < required )); then
        error "not enough disk space"
    fi
}

clone_repo() {
    if [[ ! -d "$INSTALL_DIR" ]]; then
        git clone --filter=blob:none --sparse "$REPO" "$INSTALL_DIR" \
            || error "failed to clone repository"
    fi
}

checkout_fonts() {
    cd "$INSTALL_DIR" || error "failed to enter install directory"
    git sparse-checkout set $(printf "patched-fonts/%s " "${FONTS[@]}") \
        || error "failed to checkout fonts"
}

install_fonts() {
    cd "$INSTALL_DIR" || error "failed to enter install directory"
    ./install.sh || error "failed to install $font"
}

cleanup() {
    if [[ -d "$INSTALL_DIR" ]]; then
        echo "cleaning up install directory..."
        rm -rf "$INSTALL_DIR" || error "failed to remove install directory"
    fi
}

check_space
clone_repo
checkout_fonts
install_fonts
cleanup

echo "done. installed: ${FONTS[*]}"
