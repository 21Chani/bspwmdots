#/bin/sh!

exampledir=$(
    cd "$(dirname "$0")/../example"
    pwd
)

# Install SDDM
echo "[INFO] Installing SDDM..."
yay -S --noconfirm sddm-git

# Install Theme
echo "[INFO] Installing SDDM Theme (Sugar Candy)... "
yay -S --noconfirm sddm-sugar-candy-git

echo "[INFO] Copying SDDM config..."
sudo cp -r "$exampledir/sddm.conf" /etc/sddm.conf

echo "[INFO] Enabling SDDM..."
sudo systemctl enable sddm.service
sudo systemctl start sddm.service
