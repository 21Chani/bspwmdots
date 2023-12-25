#/bin/sh!

previous_path=$(
    cd "$(dirname "$0")/.."
    pwd
)

# Dependencies
echo "[INFO] Installing Dependencies..."
sudo pacman -Syu qt5-graphicaleffects qt5-svg qt5-quickcontrols2

# Install SDDM
echo "[INFO] Installing SDDM..."
yay -S --noconfirm sddm-git

# Install Theme
install_theme() {
    echo "[INFO] Installing SDDM Theme..."
    cd $HOME
    git clone https://github.com/catppuccin/sddm.git

    cd sddm/src
    sudo cp $previous_path/sddm/catppuccin-mocha /usr/share/sddm/themes/catppuccin-mocha -r
    sudo cp ~/.local/share/backgrounds/night_forest.jpg /usr/share/sddm/themes/catppuccin-mocha/backgrounds

}

install_theme

# Configure SDDM
echo "[INFO] Copying SDDM config..."
sudo cp -r "$previous_path/sddm/sddm.conf" /etc/sddm.conf

# Copy wallpaper
sudo cp ~/.local/share/backgrounds/night_forest.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds

# Enable SDDM
echo "[INFO] Enabling SDDM..."
sudo systemctl enable sddm.service
sudo systemctl start sddm.service
