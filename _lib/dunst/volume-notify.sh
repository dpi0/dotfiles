#!/bin/bash

msgID="2345"
volume="$(pamixer --get-volume)"
muted="$(pamixer --get-mute)"
color=#00DE7EFF


# Check if audio is muted
if [ "$muted" == "true" ]; then
    dunstify "  Muted " -t 800 -r "$msgID" -u "critical"
else
    if [ "$volume" -gt "65" ]; then
        dunstify "  $volume" -t 800 -r "$msgID" -u "critical"
    else
        dunstify "  $volume" -t 800 -r "$msgID" -h string:fgcolor:"$color" -h string:frcolor:"$color"
    fi
fi

# Play sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
