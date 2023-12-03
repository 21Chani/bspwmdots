 #!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x

mocha="Catppuccin Mocha"
decayce_green="Decayce Green"
 
options=()
options+=("$mocha")
options+=("$decayce_green")


# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg "Theme Selector"\
		-markup-rows \
		-theme $HOME/.config/rofi/layouts/list-1.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	for option in "${options[@]}"; do
		echo "$option"
	done | rofi_cmd
	 
}

choosen=$(run_rofi)
case $choosen in
	"$mocha") cp $HOME/.config/kitty/themes/mocha.conf $HOME/.config/kitty/themes/theme.conf;;
	"$decayce_green") cp $HOME/.config/kitty/themes/Decay-Green.conf $HOME/.config/kitty/themes/theme.conf;;
esac

	