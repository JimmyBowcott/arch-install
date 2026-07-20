#!/usr/bin/env bash
set -euo pipefail

if ! command -v paru >/dev/null; then
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -si --noconfirm
fi

mapfile -t packages < <(
    grep -vE '^\s*#|^\s*$' packages/aur.txt
)

if [ ${#packages[@]} -gt 0 ]; then
    paru -S --needed "${packages[@]}"
fi
