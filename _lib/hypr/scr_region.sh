grim -g "$(slurp)" - | tee "/mnt/shared/screenshots/A_$(date +'%H-%M-%S_%d-%b').png" | wl-copy ; notify-send -u normal "Captured"
