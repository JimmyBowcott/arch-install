#!/usr/bin/env bash

REPO="$(cd "$(dirname "$0")/.." && pwd)"

sudo pacman -Syu --needed

for file in "$REPO"/packages/*.txt; do
    packages=()

    while read -r package; do
        [[ -z "$package" ]] && continue
        [[ "$package" =~ ^# ]] && continue
        packages+=("$package")
    done < "$file"

    if [ ${#packages[@]} -gt 0 ]; then
        sudo pacman -S --needed "${packages[@]}"
    fi
done
