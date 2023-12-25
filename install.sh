#!/bin/bash
relative_path=$(dirname "$0")

echo "Installing dependencies..."

# Yay
bash "$relative_path/src/bin/yay_install.sh"

# Xorg Server

echo "[INFO] Installing Xorg Server..."
yay -S xorg xorg-xinit

# Bspwm
echo "[INFO] Installing bspwm..."
cat "$relative_path/src/bspwm.packages.conf" | xargs yay -S

# Extra packages
cat "$relative_path/src/system.packages.conf" | xargs yay -S

# Configure apps

bash "$relative_path/src/bin/install_code_extensions.sh"

#  ▄▄  ▄▄  ▄  ▄ ▄▄▄ ▄ ▄▄▄
# █   █  █ ██▄█ █▄▄ █ █ ▄▄
# ▀▄▄ ▀▄▄▀ █ ▀█ █   █ █▄▄█

cp -r "$relative_path/home/." "$HOME"
