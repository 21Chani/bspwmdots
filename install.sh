#!/bin/bash

# PATHS
relative_path=$(dirname "$0")
scripts_dir="$relative_path/src/bin"

echo "Installing dependencies..."

# Yay
sh "$scripts_dir/yay_install.sh"

# Xorg Server

echo "[INFO] Installing Xorg Server..."
yay -S xorg xorg-xinit

# Bspwm
echo "[INFO] Installing bspwm..."
yay -S --noconfirm - <"$relative_path/src/bspwm.packages.conf"

# Extra packages
echo "[INFO] Installing app packages..."
yay -S --noconfirm - <"$relative_path/src/system.packages.conf"

# Install zsh
bash "$scripts_dir/zsh_install.sh"

# Configure apps
betterdiscordctl install
sh "$scripts_dir/install_code_extensions.sh"

#  ▄▄  ▄▄  ▄  ▄ ▄▄▄ ▄ ▄▄▄
# █   █  █ ██▄█ █▄▄ █ █ ▄▄
# ▀▄▄ ▀▄▄▀ █ ▀█ █   █ █▄▄█

cp -r "$relative_path/home/." "$HOME"

# Set wallpaper
sh "$scripts_dir/set_wallpaper.sh"

# Install SDDM
sh "$scripts_dir/install_sddm.sh"
