#!/bin/bash

selected_color=$(hyprpicker -a)
notify-send -h string:fgcolor:"$selected_color" -h string:frcolor:"$selected_color" "$selected_color"