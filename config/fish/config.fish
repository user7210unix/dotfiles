set -g fish_color_normal white
set -g fish_color_command green
set -g fish_color_redirection yellow
set -g fish_color_error red
set -g fish_color_comment cyan
set -g fish_color_command_substitution magenta
set -g fish_color_operator yellow
set -g fish_color_argument blue

function fish_prompt
    set_color normal
    echo -n (basename (pwd))
    set_color normal
    echo -n '  '

    set_color blue
    echo -n ' '
    set_color normal
    echo -n '  '
end

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias fetch='pfetch'
alias c='clear'
alias off='sudo poweroff'

alias install='sudo pacman -Sy --noconfirm'
alias update='sudo pacman -Syu --noconfirm'
alias clone 'git clone --depth 1'
alias merge 'xrdb ~/.Xresources'


set -g fish_greeting '' 
clear
neofetch
