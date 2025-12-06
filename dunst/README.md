# Dunst

Notification daemon.

```bash
ln -s ~/.dotfiles/dunst/ ~/.config/

# TO restart the daemon and apply the configuration
killall dunst
```

Make sure to have `exec-once = dunst` in `~/.dotfiles/hypr/hyprland.conf`.

Test notifications

```bash
dunstify -u low "Low" "This is a low urgency notification"
dunstify -u normal "Normal" "This is a normal urgency notification. Open https://github.com/dpi0/dotfiles"
dunstify -u critical "Critical" "This is a critical urgency notification"
```
