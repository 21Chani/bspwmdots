#!/bin/bash

# Get the ID of the focused window
focused_window_id=$(bspc query -N -n focused)

# Get the state of the focused window
window_state=$(bspc query -n "$focused_window_id" --tree | jq -r ".client.state")

# Toggle the state between tiled and floating
if [[ $window_state == "tiled" ]]; then
    bspc node -t floating
else
    bspc node -t tiled
fi

