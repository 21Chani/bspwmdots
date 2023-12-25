#/bin/sh!

monitors=$(xrandr --listmonitors)

xrandr --listmonitors | awk '/Monitors/{next} {print $NF}' | awk '{print NR-1, $0}' | while read -r index monitor; do
    echo "Setting background for Monitor $index: $monitor"
    nitrogen --set-zoom-fill --head="$index" $HOME/.local/share/backgrounds/night_forest.jpg
done
