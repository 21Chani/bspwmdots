#!/bin/bash
relative_path=$(dirname "$0")

echo "Installing dependencies..."

# Yay
bash "$relative_path/src/bin/yay_install.sh"

# Xorg Server

echo "[INFO] Installing Xorg Server..."
yay -S xorg xorg-xinit

echo "[INFO] Installing bspwm..."
yay -S bspwm sxhkd picom nitrogen polybar firefox

#  ▄▄  ▄▄  ▄  ▄ ▄▄▄ ▄ ▄▄▄
# █   █  █ ██▄█ █▄▄ █ █ ▄▄
# ▀▄▄ ▀▄▄▀ █ ▀█ █   █ █▄▄█

cp -r "$relative_path/home/." "$HOME"
