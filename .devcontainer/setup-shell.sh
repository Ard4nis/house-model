#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(
  cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
  pwd
)"

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
SYNTAX_HIGHLIGHTING_DIR="$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"

# ---------------------------------------------------------------------------
# Starship
# ---------------------------------------------------------------------------

mkdir -p "$HOME/.config"
ln -sfn "$SCRIPT_DIR/starship.toml" "$HOME/.config/starship.toml"

# ---------------------------------------------------------------------------
# Oh My Zsh plugins
# ---------------------------------------------------------------------------

if [ ! -d "$AUTOSUGGESTIONS_DIR/.git" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone --depth=1 \
    https://github.com/zsh-users/zsh-autosuggestions \
    "$AUTOSUGGESTIONS_DIR"
fi

if [ ! -d "$SYNTAX_HIGHLIGHTING_DIR/.git" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone --depth=1 \
    https://github.com/zsh-users/zsh-syntax-highlighting \
    "$SYNTAX_HIGHLIGHTING_DIR"
fi

# ---------------------------------------------------------------------------
# zsh configuration
# ---------------------------------------------------------------------------

cat > "$HOME/.zshrc" <<'EOF'
export ZSH="$HOME/.oh-my-zsh"

# Starship owns the prompt.
ZSH_THEME=""

plugins=(
  git
  npm
  history
  z
  zsh-autosuggestions
)

# Dev containers are disposable; don't let OMZ update itself independently.
zstyle ':omz:update' mode disabled

# Autosuggestion appearance.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

source "$ZSH/oh-my-zsh.sh"

# Remove zsh's default right-prompt padding.
ZLE_RPROMPT_INDENT=0

# ---------------------------------------------------------------------------
# Starship
# ---------------------------------------------------------------------------

eval "$(starship init zsh)"

# ---------------------------------------------------------------------------
# Transient prompt
#
# Redraw submitted commands with a minimal prompt while leaving the active
# prompt fully rendered by Starship.
# ---------------------------------------------------------------------------

_transient_zle_line_init() {
  emulate -L zsh

  [[ $CONTEXT == start ]] || return 0

  while true; do
    zle .recursive-edit
    local -i ret=$?

    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
  done

  local saved_prompt="$PROMPT"
  local saved_rprompt="$RPROMPT"

  PROMPT=$'%F{green}❯%f '
  RPROMPT=''

  zle .reset-prompt

  PROMPT="$saved_prompt"
  RPROMPT="$saved_rprompt"

  if (( ret )); then
    zle .send-break
  else
    zle .accept-line
  fi

  return ret
}

zle -N zle-line-init _transient_zle_line_init

# ---------------------------------------------------------------------------
# Nerd Font check
# ---------------------------------------------------------------------------

font-check() {
  echo
  echo "Nerd Font visual check"
  echo "────────────────────────────────────"
  echo
  echo "  Powerline:     "
  echo "  Git:        "
  echo "  Folder:     "
  echo "  Node.js:    "
  echo "  Lock:       "
  echo "  Clock:      "
  echo "  Duration:   "
  echo
  echo "Expected font:"
  echo "  MesloLGS NF"
  echo
  echo "If the symbols above appear as boxes, question marks,"
  echo "or malformed characters, install the Nerd Font on the"
  echo "HOST machine and restart VS Code."
  echo
  echo "macOS:"
  echo "  bash .devcontainer/host/install-font-macos.sh"
  echo
  echo "Windows PowerShell:"
  echo '  powershell -NoProfile -ExecutionPolicy Bypass -File .devcontainer\host\install-font-windows.ps1'
  echo
  echo "Linux:"
  echo "  bash .devcontainer/host/install-font-linux.sh"
  echo
}

# ---------------------------------------------------------------------------
# Syntax highlighting
#
# Must be sourced after our custom ZLE widgets.
# ---------------------------------------------------------------------------

source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
EOF

echo
echo "Configured:"
echo "  zsh"
echo "  Oh My Zsh"
echo "  Starship"
echo "  zsh-autosuggestions"
echo "  zsh-syntax-highlighting"
echo
echo "Open a new terminal or run:"
echo
echo "  exec zsh"
echo
echo "Then run:"
echo
echo "  font-check"