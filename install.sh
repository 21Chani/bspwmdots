#!/bin/bash
relative_path=$(dirname "$0")

echo "Installing dependencies..."

# Yay
sh "$relative_path/src/bin/yay_install.sh"

# Xorg Server

echo "[INFO] Installing Xorg Server..."
yay -S xorg xorg-xinit

# Bspwm
echo "[INFO] Installing bspwm..."
yay -S --noconfirm - <"$relative_path/src/bspwm.packages.conf"

# Extra packages
yay -S --noconfirm - <"$relative_path/src/system.packages.conf"

# Install zsh
bash "$relative_path/src/bin/zsh_install.sh"

# Configure apps

sh "$relative_path/src/bin/install_code_extensions.sh"

#  ▄▄  ▄▄  ▄  ▄ ▄▄▄ ▄ ▄▄▄
# █   █  █ ██▄█ █▄▄ █ █ ▄▄
# ▀▄▄ ▀▄▄▀ █ ▀█ █   █ █▄▄█

cp -r "$relative_path/home/." "$HOME"

# Set wallpaper
sh "$relative_path/src/bin/set_wallpaper.sh"

# Install SDDM
sh "$relative_path/src/bin/install_sddm.sh"
