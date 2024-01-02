configure_spicetify() {
    echo "[INFO] Configuring spicetify"

    # Clone Catppuccin theme
    cd $HOME
    git clone https://github.com/catppuccin/spicetify.git

    # Move theme to right spicetify folder
    cd spicetify
    cp -r catppuccin ~/.config/spicetify/Themes

    # Remove unnused files
    cd $HOME
    sudo rm -r spicetify

    # Give permissions to spicetify
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R

    # Apply Backup
    spicetify backup apply

    # Apply theme
    spicetify config current_theme catppuccin
    spicetify config color_scheme mocha
    spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1
    spicetify apply
}

if command -v spicetify >/dev/null 2>&1; then
    configure_spicetify
else
    # TODO: ask user if they want to install spicetify
    echo "Spicetify command does not exist, ignoring spicetify configuration"
fi
