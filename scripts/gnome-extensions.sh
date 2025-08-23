#!/usr/bin/env bash

set -e

BACKUP_DIR="$HOME/.gnome-extensions-backup"

backup() {
    echo "[*] Backing up GNOME extensions..."
    mkdir -p "$BACKUP_DIR"

    cp -a ~/.local/share/gnome-shell/extensions "$BACKUP_DIR/extensions"

    dconf dump /org/gnome/shell/extensions/ > "$BACKUP_DIR/ext.dconf"

    echo "[✓] Backup complete → $BACKUP_DIR"
}

restore() {
    echo "[*] Restoring GNOME extensions..."

    # Restore extension files
    cp -a "$BACKUP_DIR/extensions"/* ~/.local/share/gnome-shell/extensions/

    # Restore settings
    dconf load /org/gnome/shell/extensions/ < "$BACKUP_DIR/ext.dconf"

    echo "[✓] Restore complete. Log out and log back in for changes to apply."
}

case "$1" in
    backup) backup ;;
    restore) restore ;;
    *) echo "Usage: $0 {backup|restore}" ;;
esac

