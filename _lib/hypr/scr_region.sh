region=$(slurp)

# Check if the region is not empty (user did not cancel)
if [ -n "$region" ]; then
	grim -g "$region" - | swappy -f - | wl-copy
	notify-send -u normal "Screenshot Taken"
fi