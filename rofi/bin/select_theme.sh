#!/bin/sh
source $HOME/.config/rofi/bin/source/theme_options.sh

selected_theme=$1

if [ "$selected_theme" == "" ]; then
    echo "No theme selected"
    notify-send "No theme selected"
    exit 1
fi

vscode_user_dir=$HOME/.config/Code/User

select_vscode_theme() {
    # Get the current theme
    notify-send "Selecting vscode theme"
    jq ".\"workbench.colorTheme\" = \"$1\"" $vscode_user_dir/settings.json >$vscode_user_dir/temp.json && mv $vscode_user_dir/temp.json $vscode_user_dir/settings.json
}

select_spotify_theme() {
    if [ spicetify ]; then
        theme=$1
        schema=$2

        spicetify config current_theme $theme
        if [ "$schema" != "" ]; then
            spicetify config color_scheme $schema
        fi

        spicetify apply

    else
        echo "Spicetify not installed ignoring it"
    fi

}

if [ "$selected_theme" == "$mocha" ]; then

    # Move to the kitty themes folderz
    cp $HOME/.config/kitty/themes/mocha.conf $HOME/.config/kitty/themes/theme.conf

    # Edit Vscode settings.json
    select_vscode_theme "$mocha"

    # Edit spicetify
    select_spotify_theme "catppuccin" "mocha"

    echo "Theme changed to $mocha"

elif [ "$selected_theme" == "$decayce_green" ]; then

    # Move to the kitty themes folder
    cp $HOME/.config/kitty/themes/Decay-Green.conf $HOME/.config/kitty/themes/theme.conf

    # Edit Vscode settings.json
    select_vscode_theme "$decayce_green"

    # Edit spicetify
    select_spotify_theme "decayce"

    echo "Theme changed to $decayce_green"
fi
