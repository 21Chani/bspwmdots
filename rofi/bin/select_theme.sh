#!/bin/sh
source $HOME/.config/rofi/bin/source/theme_options.sh

selected_theme=$1

if [ "$selected_theme" == "" ]; then
    echo "No theme selected"
    notify-send "No theme selected"
    exit 1
fi

if [ "$selected_theme" == "$mocha" ]; then

    # Move to the kitty themes folder
    cp $HOME/.config/kitty/themes/mocha.conf $HOME/.config/kitty/themes/theme.conf
    echo "Theme changed to $mocha"

elif [ "$selected_theme" == "$decayce_green" ]; then

    # Move to the kitty themes folder
    cp $HOME/.config/kitty/themes/Decay-Green.conf $HOME/.config/kitty/themes/theme.conf
    echo "Theme changed to $decayce_green"
fi
