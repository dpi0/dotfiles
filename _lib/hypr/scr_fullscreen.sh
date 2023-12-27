timestamp=$(date +'%H-%M-%S_%d-%b')
screenshot_path="/mnt/shared/screenshots/S_$timestamp.jpg"

# Check if the screenshot is taken successfully
if grim "$screenshot_path"; then
    wl-copy < "$screenshot_path"
    notify-send -u normal "Screenshot Taken: $screenshot_path"
fi
