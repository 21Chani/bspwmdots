#/bin/sh!

exampledir=$(
    cd "$(dirname "$0/..")/example"
    pwd
)

# Install SDDM
echo "[INFO] Installing SDDM..."
yay -S sddm-git

# Install Theme
echo "[INFO] Installing SDDM Theme (Sugar Candy)... "
yay -S sddm-sugar-candy-git

sudo cp -r "$exampledir/sddm.conf" /etc/sddm.conf
