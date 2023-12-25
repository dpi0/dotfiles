#!/bin/bash

msgID="7231"
brightness_info=$(brightnessctl -m)
brightness=$(echo "$brightness_info" | choose -f "," 3)
color=#FFBF00FF

dunstify "󰃞 $brightness" -t 800 -r "$msgID" -h string:fgcolor:"$color" -h string:frcolor:"$color"