#!/usr/bin/env bash
set -euo pipefail

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable sddm

if [[ "$SHELL" != "$(command -v zsh)" ]]; then
    chsh -s "$(command -v zsh)"
fi

mkdir -p "$HOME/bin"
mkdir -p "$HOME/.local/bin"
