# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#!/bin/bash
echo "Free Memory: $(free -h | awk '/^Mem/ {print $4}')"
echo "Disk Usage: $(df -h | awk '/\/$/ {print $5}')"

date

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


#ALIAS COMMANDS
alias hackernews='/home/user/hackernews-TUI/./target/release/hackernews_tui'
alias install='sudo nala install'
alias update= 'sudo nala update && sudo nala upgrade'
alias discord='/home/user/discordo/./discordo'
alias top='/home/user/gotop/./gotop'
alias fetch='neofetch'
alias c='clear'
alias vi='nvim'
alias ping='ping gnu.org'
alias rm='rm -rf'
alias chest='/home/user/chess-tui/./target/release/chess-tui' 
alias clone='git clone'
alias retro='/home/user/cool-retro-term/./cool-retro-term'


#Display Pokemon-colorscripts
#Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

# fastfetch. Will be disabled if above colorscript was chosen to install
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
