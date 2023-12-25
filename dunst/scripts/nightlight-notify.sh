#!/bin/bash

msgID="4122"
nightlight_info=$(busctl --user introspect rs.wl-gammarelay / rs.wl.gammarelay)
nightlight=$(echo "$nightlight_info" | choose 3 | awk 'NR==5')
color=#FF6D2EFF


dunstify " $nightlight" -t 800 -r "$msgID" -h string:fgcolor:"$color" -h string:frcolor:"$color"