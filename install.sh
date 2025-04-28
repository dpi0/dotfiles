#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"

if [ ! -d "$DOTFILES_DIR" ] || [ ! -d "$CONFIG_DIR" ]; then
  echo "❌ One or both of the required directories do not exist. Exiting."
  exit 1
fi

link() {
  SRC="$1"
  DEST="$2"
  TIMESTAMP=$(date +"%d-%B-%Y_%H-%M-%S")
  BACKUP_PATH="${DEST}_$TIMESTAMP"

  # If it's already the correct symlink, do nothing
  # if [ -L "$DEST" ] && [ "$(readlink "$DEST")" = "$SRC" ]; then
  #   echo "✅ Already correctly linked: $DEST"
  #   return
  # fi

  # If a regular file/directory exists, back it up
  if [ -e "$DEST" ] || [ -L "$DEST" ]; then
    echo "🗂️ Backing up existing: $DEST -> $BACKUP_PATH"
    mv "$DEST" "$BACKUP_PATH"
  fi

  mkdir -p "$(dirname "$DEST")"
  ln -s "$SRC" "$DEST"
  echo "🔗 Symlinked: $SRC -> $DEST"
}

mkdir -p "$CONFIG_DIR/btop" "$CONFIG_DIR/systemd"

# link "$DOTFILES_DIR/alacritty" "$CONFIG_DIR/alacritty"
link "$DOTFILES_DIR/dunst" "$CONFIG_DIR/dunst"
link "$DOTFILES_DIR/foot" "$CONFIG_DIR/foot"
link "$DOTFILES_DIR/gammastep" "$CONFIG_DIR/gammastep"
link "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"
link "$DOTFILES_DIR/rofi" "$CONFIG_DIR/rofi"
# link "$DOTFILES_DIR/systemd/user" "$CONFIG_DIR/systemd"
# link "$DOTFILES_DIR/vscode/Code/User" "$CONFIG_DIR/Code/User"
# link "$DOTFILES_DIR/vscode/argv.json" "$HOME/.vscode/argv.json"
link "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar"
link "$DOTFILES_DIR/wezterms" "$CONFIG_DIR/wezterms"
link "$DOTFILES_DIR/.zprofile" "$HOME/.profile"
link "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"

# sudo ln -s $HOME/.dotfiles/greetd/config.toml /etc/greetd/config.toml

echo "✅ Dotfiles installation complete."
