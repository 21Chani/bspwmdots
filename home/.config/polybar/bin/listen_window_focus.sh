map_icons() {
    case $1 in
    "Google-chrome") echo "" ;;
    "Firefox" | "firefox") echo "" ;;
    "Slack") echo "" ;;
    "Spotify") echo "" ;;
    "TelegramDesktop") echo "" ;;
    "Thunar") echo "" ;;
    "Vlc") echo "" ;;
    "Code") echo "󰨞" ;;
    "Kitty" | "kitty") echo "" ;;

    esac

}

bspc subscribe node_focus | while read -r line; do
    window_id=$(echo "$line" | awk '{print $NF}')

    # Use xdotool to get the title of the focused window
    window_class=$(xprop -id "$window_id" | awk -F '"' '/WM_CLASS/{print $4}')
    window_title=$(xdotool getwindowname "$window_id")
    echo $(map_icons "$window_class") $window_title
done
