~/.local/bin/grimblast --freeze copysave area /shared/screenshots/A_$(date +'%H-%M-%S_%d-%b').png ; notify-send -u normal "Captured"
# grim -g "$(slurp)" - | tee "/shared/screenshots/A_$(date +'%H-%M-%S_%d-%b').png" | wl-copy ; notify-send -u normal "Captured"

