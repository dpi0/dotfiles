timestamp=$(date +'%H-%M-%S_%d-%b')
filename="/mnt/shared/screenshots/R_$timestamp.mp4"

region=$(slurp)

notify-send -u normal "Recording Started!"

# Check if the region is not empty (user did not cancel)
if [ -n "$region" ]; then
    wf-recorder -g "$region" -f "$filename"
    notify-send -u critical "Recording Stopped: $filename"
fi
