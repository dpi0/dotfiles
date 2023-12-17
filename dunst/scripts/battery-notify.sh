#!/bin/bash

msgID="9312"
battery_info=$(acpi -b)
battery=$(echo "$battery_info" | choose 3 | choose -c 0:1)
battery_time_left=$(echo "$battery_info" | choose 4:6)
charging=$(echo "$battery_info" | choose 2 | choose -c 0:7)

color="#C059FFFF"
bolt_icon="🗲"  # Unicode bolt symbol

notification_msg="$battery%"
if [ "$charging" == "Charging" ]; then
    # notification_msg="$bolt_icon $notification_msg (Charging)"
	dunstify "$bolt_icon $notification_msg (Charging)" -t 2500 -r "$msgID" -h string:fgcolor:"$color" -h string:frcolor:"$color"
	
else
	dunstify "󰂁 $notification_msg" -t 2500 -r "$msgID" -h string:fgcolor:"$color" -h string:frcolor:"$color"
fi


# dunstify "󰂁 $notification_msg" -t 2500 -r "$msgID" -h string:fgcolor:"$color" -h string:frcolor:"$color"
