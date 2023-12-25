#/bin/sh!

src_path=$(
    cd "$(dirname "$0")/.."
    pwd
)

sudo mkdir /user/share/zsh-theme-powerlevel10k
sudo cp -r $src_path/powerlevel10k.zsh-theme /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Install zsh
yay -S --noconfirm zsh
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powrlevel10k
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
