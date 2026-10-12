#!/usr/bin/env bash
set -euo pipefail

NERD_FONTS_VERSION="3.5.1"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${NERD_FONTS_VERSION}/Meslo.zip"
FONT_DIR="$HOME/Library/Fonts"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading Meslo Nerd Font ${NERD_FONTS_VERSION}..."

curl -fsSL "$FONT_URL" -o "$TMP_DIR/Meslo.zip"

mkdir -p "$TMP_DIR/Meslo"
unzip -q "$TMP_DIR/Meslo.zip" -d "$TMP_DIR/Meslo"

mkdir -p "$FONT_DIR"

find "$TMP_DIR/Meslo" \
  -type f \
  -name '*.ttf' \
  -exec cp -f {} "$FONT_DIR/" \;

echo
echo "Meslo Nerd Font installed to:"
echo "  $FONT_DIR"
echo
echo "Restart VS Code if the font is not detected immediately."