# ▗▄▄▄▖▗▄▄▄▖ ▗▄▄▖▗▖ ▗▖     ▗▄▄▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▄▖ ▗▄▄▖
# ▐▌     █  ▐▌   ▐▌ ▐▌    ▐▌   ▐▌ ▐▌▐▛▚▖▐▌▐▌     █  ▐▌   
# ▐▛▀▀▘  █   ▝▀▚▖▐▛▀▜▌    ▐▌   ▐▌ ▐▌▐▌ ▝▜▌▐▛▀▀▘  █  ▐▌▝▜▌
# ▐▌   ▗▄█▄▖▗▄▄▞▘▐▌ ▐▌    ▝▚▄▄▖▝▚▄▞▘▐▌  ▐▌▐▌   ▗▄█▄▖▝▚▄▞▘
                                                       
set -g fish_color_normal white
set -g fish_color_command green
set -g fish_color_redirection yellow
set -g fish_color_error red
set -g fish_color_comment cyan
set -g fish_color_command_substitution magenta
set -g fish_color_operator yellow
set -g fish_color_argument white

#  ▗▄▖ ▗▖ ▗▖▗▄▄▄▖▗▄▄▖ ▗▖ ▗▖▗▄▄▄▖
# ▐▌ ▐▌▐▌ ▐▌  █  ▐▌ ▐▌▐▌ ▐▌  █  
# ▐▌ ▐▌▐▌ ▐▌  █  ▐▛▀▘ ▐▌ ▐▌  █  
# ▝▚▄▞▘▝▚▄▞▘  █  ▐▌   ▝▚▄▞▘  █  

function fish_prompt
    set -l pwd (pwd | sed "s|$HOME|~|")  # Replace $HOME with ~ for home directory
    set -l last_dir (basename "$pwd")   # Extract the last directory name
    set -l parent_dir (dirname "$pwd") # Extract the parent directory

    # If in home (~), show [~]
    if test "$pwd" = "~"
        set_color grey
        echo -n "["
        set_color normal
        echo -n "~"
        set_color grey
        echo -n "]  "
    else
        # Display [parentdir/lastdir] with brackets in grey and lastdir in blue
        set_color grey
        echo -n "["
        set_color normal
        echo -n (string replace "$last_dir" "" "$pwd")
        set_color white
        echo -n "$last_dir"
        set_color grey
        echo -n "]  "
    end

    set_color yellow
    echo -n '  '
    set_color normal
    echo -n '  '
end

#  ▗▄▖ ▗▖   ▗▄▄▄▖ ▗▄▖  ▗▄▄▖
# ▐▌ ▐▌▐▌     █  ▐▌ ▐▌▐▌   
# ▐▛▀▜▌▐▌     █  ▐▛▀▜▌ ▝▀▚▖
# ▐▌ ▐▌▐▙▄▄▖▗▄█▄▖▐▌ ▐▌▗▄▄▞▘

alias ls='lsd -a'
alias grep='grep --color=auto'
alias lf='exa -abghHliS'
alias tree='exa --long --tree'
alias c='clear'
alias cat='bat'
alias htop='glances'
alias ping='gping gnu.org'
alias langde='setxkbmap de'
alias langus='setxkbmap us'

# alias install='sudo nala install -y'
# alias install='apt nala install -y'
# alias install='sudo emerge'
alias install='sudo pacman -Sy --noconfirm'
# alias install='doas pkg install'
# alias install='kpkg install'
alias search='sudo pacman -Ss'

# alias update='sudo apt update -y && sudo apt upgrade -y'
# alias update='sudo nala update -y && sudo nala upgrade -y'
# alias update='sudo emerge sync'
alias update='sudo pacman -Syu --noconfirm'
# alias update='doas pkg update'
# alias update='kpkg update'

alias clone 'git clone --depth 1'
alias merge 'xrdb ~/.Xresources'
alias vim 'nvim'
alias lol 'echo "You want a long Uptime!"'
alias off="poweroff"
set -g fish_greeting '' 
clear
set -x PATH $HOME/.cargo/bin $PATH
set -gx PATH $PATH ~/.local/bin
