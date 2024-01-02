#/bin/sh!

src_path=$(
    cd "$(dirname "$0")/.."
    pwd
)

install_plugins() {
    git clone https://github.com/sobolevn/wakatime-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/wakatime
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

sudo mkdir /user/share/zsh-theme-powerlevel10k
sudo cp -r $src_path/powerlevel10k.zsh-theme /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Install zsh
yay -S --noconfirm zsh
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --skip-chsh --keep-zshrc

# Install powrlevel10k
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

install_plugins
