#!/bin/sh
source $HOME/.config/rofi/bin/source/theme_options.sh

selected_theme=$1

if [ "$selected_theme" == "" ]; then
    echo "No theme selected"
    notify-send "No theme selected"
    exit 1
fi

vscode_user_dir=$HOME/.config/Code/User
rofi_themes_dir=$HOME/.config/rofi/themes
kitty_themes_dir=$HOME/.config/kitty/themes
bspwm_colors_dir=$HOME/.config/bspwm/colors

select_vscode_theme() {
    # Get the current theme
    notify-send "Selecting vscode theme"
    jq ".\"workbench.colorTheme\" = \"$1\"" $vscode_user_dir/settings.json >$vscode_user_dir/temp.json && mv $vscode_user_dir/temp.json $vscode_user_dir/settings.json
}

set_bspwm_theme() {
    theme_file=$1
    cp $bspwm_colors_dir/$theme_file $bspwm_colors_dir/current_color.sh
    bash $bspwm_colors_dir/current_color.sh
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
    cp $kitty_themes_dir/mocha.conf $kitty_themes_dir/theme.conf

    # Edit Vscode settings.json
    select_vscode_theme "$mocha"

    # Update Rofi theme
    cp $rofi_themes_dir/Catppuccin-Mocha.rasi $rofi_themes_dir/theme.rasi

    # Update bspwm theme
    set_bspwm_theme "Catppuccin_Mocharc"

    # Set KDE theme
    kvantummanager --set Catppuccin-Mocha

    # Edit spicetify
    select_spotify_theme "catppuccin" "mocha"
    echo "Theme changed to $mocha"

elif [ "$selected_theme" == "$decayce_green" ]; then

    # Move to the kitty themes folder
    cp $kitty_themes_dir/Decay-Green.conf $kitty_themes_dir/theme.conf

    # Edit Vscode settings.json
    select_vscode_theme "$decayce_green"

    # Update Rofi theme
    cp $rofi_themes_dir/Decaycez.rasi $rofi_themes_dir/theme.rasi

    # Update bspwm theme
    set_bspwm_theme "Decaycexrc"

    # Set KDE theme
    kvantummanager --set Decay-Green

    # Edit spicetify
    select_spotify_theme "decayce"

    echo "Theme changed to $decayce_green"
fi
