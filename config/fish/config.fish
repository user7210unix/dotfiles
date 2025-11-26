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
        set_color blue
        echo -n "$last_dir"
        set_color grey
        echo -n "]  "
    end

    set_color blue
    echo -n ' '
    set_color normal
    echo -n '  '
end
#----Alias-----------------
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
#alias fetch='pfetch'
alias c='clear'
alias off='poweroff'

alias langde='setxkbmap de'
alias langus='setxkbmap us'

alias install='sudo nala install -y'
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
