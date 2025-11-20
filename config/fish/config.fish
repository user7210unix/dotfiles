#----Colors------------------                            
set -g fish_color_normal white
set -g fish_color_command green
set -g fish_color_redirection yellow
set -g fish_color_error red
set -g fish_color_comment cyan
set -g fish_color_command_substitution magenta
set -g fish_color_operator yellow
set -g fish_color_argument blue

#----Prompt----------------
function fish_prompt
    if test $status -ne 0
        set_color red
        printf "(!) "
        set_color normal
    end

    set_color cyan
    printf "%s@%s" (whoami) (hostname)
    set_color normal
    printf ":%s" (prompt_pwd)

    set_color yellow
    printf " [%s]" (date "+%H:%M")
    set_color normal

    printf "\n\$ "
end


#----Alias-----------------
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
#alias fetch='pfetch'
alias c='clear'
alias off='poweroff'

alias langde='setxkbmap de'
alias langus='setxkbmap us'

# alias install='sudo nala install -y'
# alias install='apt nala install -y'
# alias install='sudo emerge'
# alias install='sudo pacman -Sy --noconfirm'
# alias install='doas pkg install'
# alias install='kpkg install'


# alias update='sudo apt update -y && sudo apt upgrade -y'
# alias update='sudo nala update -y && sudo nala upgrade -y'
# alias update='sudo emerge sync'
# alias update='sudo pacman -Syu --noconfirm'
# alias update='doas pkg update'
# alias update='kpkg update'

alias clone 'git clone --depth 1'
alias merge 'xrdb ~/.Xresources'


set -g fish_greeting '' 
clear
