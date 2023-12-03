#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x

relative_dir=$(dirname $0)
source $relative_dir/source/theme_options.sh

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg "Theme Selector" \
		-markup-rows \
		-theme $HOME/.config/rofi/layouts/list-1.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	for option in "${theme_options[@]}"; do
		echo "$option"
	done | rofi_cmd

}

choosen=$(run_rofi)
exec $HOME/.config/rofi/bin/select_theme.sh "$choosen"
