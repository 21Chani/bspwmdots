 #!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x

rofi_cmd() {
	rofi -dmenu \
		-mesg "Keyboard Selector"\
		-markup-rows \
		-theme $HOME/.config/rofi/layouts/list-1.rasi
}

english="English (North America)"
portuguese="Portuguese (Brazil)"

keyboard_layouts=()
keyboard_layouts+=("$english")
keyboard_layouts+=("$portuguese")

# Pass variables to rofi dmenu
run_rofi() {
	# echo -e "English (North America)\nPortuguese (Brazil)" | rofi_cmd
	for layout in "${keyboard_layouts[@]}"; do
		echo "$layout"
	done | rofi_cmd
}

choosen=$(run_rofi)

case $choosen in
	$english) setxkbmap us && notify-send "Keyboard Layout" "English (North America)" ;;
	$portuguese) setxkbmap br && notify-send "Keyboard Layout" "Portuguese (Brazil)" ;;
esac

