. "$HOME/.cargo/env"

export LIGHT_WALLPAPER="$HOME/Wallpapers/wallpapers/wallpapers/win-mac/OSX-10-9-6k.jpg"
export DARK_WALLPAPER="$HOME/Wallpapers/wallpapers/wallpapers/win-mac/OSX-10-6-Server-6k.jpg"
export LOCK_SCREEN_BG="$HOME/Wallpapers/wallpapers/wallpapers/abstract/Acrylic Paint 2.jpg"

# Only execute on tty1 and if not already in a Wayland session
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    clear
    #exec Hyprland > /dev/null 
    exec Hyprland > .hyprland.log.txt 2> .hyprland.err.txt
fi

