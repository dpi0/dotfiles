. "$HOME/.cargo/env"

# Only execute on tty1 and if not already in a Wayland session
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  clear
  #exec Hyprland > /dev/null
  exec Hyprland >.hyprland.log.txt 2>.hyprland.err.txt
fi

export CLIPHIST_MAX_ITEMS=5000
export CLIPHIST_PREVIEW_WIDTH=120
