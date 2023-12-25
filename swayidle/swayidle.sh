swayidle -w \
timeout 120 '[ "$(cat /sys/class/power_supply/AC/online)" = "0" ] && brightnessctl -s && brightnessctl set 5%' \
resume 'brightnessctl -r' \
timeout 180 '[ "$(cat /sys/class/power_supply/AC/online)" = "0" ] && hyprctl dispatch dpms off' \
resume 'hyprctl dispatch dpms on' \
timeout 480 'swaylock -f' \
timeout 1200 '[ "$(cat /sys/class/power_supply/AC/online)" = "0" ] && systemctl suspend' \
after-resume 'hyprctl dispatch dpms on'
