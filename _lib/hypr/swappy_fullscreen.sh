timestamp=$(date +'%H-%M-%S_%d-%b')
filename="/mnt/shared/screenshots/FS_$timestamp.jpg"

grim - | swappy -f - | wl-copy
notify-send -u normal "Screenshot Taken: $filename"
