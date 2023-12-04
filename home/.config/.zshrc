
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
plugins=(git; zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

 
# ▄▀█ █   █ ▄▀█ █▀ █▀▀ █▀
# █▀█ █▄▄ █ █▀█ ▄█ ██▄ ▄█

alias  l='eza -lh  --icons=auto' 
alias ls='eza -1   --icons=auto' 
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' 


# █ █ ▄▀█ █▀█ █ ▄▀█ █▄▄ █  █▀▀ █▀
# ▀▄▀ █▀█ █▀▄ █ █▀█ █▄█ █▄ ██▄ ▄█

# PATH 
export REPOS="$HOME/repos"
export GHREPOS="$REPOS/github.com"
export GHUSR="$GHREPOS/21Chani"
export MARIGOLD="$GHREPOS/Marigold"

# CD_PATH
cdpath=($REPOS;$GHREPOS;$GHUSR;$MARIGOLD)

# CONFIG
export CONFIG_DIR="$HOME/.config"
export BSPWM_DIR="$CONFIG_DIR/bspwm"
export SXHKD_DIR="$CONFIG_DIR/sxhkd"
export POLYBAR_DIR="$CONFIG_DIR/polybar"
export PICOM_DIR="$CONFIG_DIR/picom"

# ROFI
export ROFI_DIR="$CONFIG_DIR/rofi"
export LAUNCHERS_DIR="$ROFI_DIR/launchers"
export PSCALE_DISABLE_DEV_WARNING=true

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
neofetch
