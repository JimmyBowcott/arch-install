#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"

rsync -a "$REPO/home/" "$HOME/"
