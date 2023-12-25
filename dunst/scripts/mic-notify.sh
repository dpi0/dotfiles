#!/bin/bash

msgID="7623"

mic_volume="$(pamixer --default-source --get-volume)"
muted="$(pamixer --default-source --get-mute)"
color=#FEABFFFF


if [ "$muted" == "true" ]; then
    dunstify " Muted " -t 800 -r "$msgID" -u "critical"
else
    if [ "$mic_volume" -gt "65" ]; then
        dunstify " $mic_volume" -t 800 -r "$msgID" -u "critical"
    else
        dunstify " $mic_volume" -t 800 -r "$msgID" -h string:fgcolor:"$color" -h string:frcolor:"$color"
    fi
fi

# Play sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
