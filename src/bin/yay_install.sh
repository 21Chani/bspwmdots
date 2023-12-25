#/bin/sh!

# ▄ ▄  ▄▄ ▄ ▄   ▄▄▄  ▄▄  ▄▄ ▄  ▄  ▄▄ ▄▄▄  ▄▄▄
# █▄█ █ █ █▄█   █▄█ █ █ █   █▄▀  █ █ █ ▄▄ █▄▄
# ▄█  █▀█ ▄█    █   █▀█ ▀▄▄ █ ▀▄ █▀█ █▄▄█ █▄▄

if command -v yay >/dev/null 2>&1; then
    echo "Yay exists, ignoring install."
else

    echo "Yay does not exist. Would you like to install it? (y/n)"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
        echo "Installing yay..."

        if pacman -Qs base-devel >/dev/null 2>&1; then
            echo "[INFO]: base-devel package is installed."
        else
            echo "[INFO]: base-devel package is not installed. Would you like to install it? (y/n)"
            read -r response
            if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
                echo "Installing base-devel package..."
                sudo pacman -S base-devel
            else
                echo "Skipping base-devel package installation."
                exit 1
            fi
        fi

        cd $HOME
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        cd ..
        rm -rf yay
    else
        echo "Skipping yay install."
        exit 1
    fi
fi
