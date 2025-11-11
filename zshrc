# ╔═══════════════════════════════════════════════════════════╗
# ║                    ZSH CONFIGURATION                      ║
# ╚═══════════════════════════════════════════════════════════╝

# ─────────────────────────────────────────────────────────────
# History Configuration
# ─────────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# ─────────────────────────────────────────────────────────────
# Shell Options
# ─────────────────────────────────────────────────────────────
setopt AUTO_CD              # Type directory name to cd
setopt AUTO_PUSHD           # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates
setopt PUSHD_SILENT         # Don't print directory stack
setopt CORRECT              # Correct command typos
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell
setopt EXTENDED_GLOB        # Extended globbing

# ─────────────────────────────────────────────────────────────
# Plugin Management (Manual Installation)
# ─────────────────────────────────────────────────────────────
# Install plugins manually:
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions

# Load plugins if available
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add completions to fpath
fpath=(~/.zsh/zsh-completions/src $fpath)

# ─────────────────────────────────────────────────────────────
# Autosuggestion Configuration
# ─────────────────────────────────────────────────────────────
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#646a73'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# ─────────────────────────────────────────────────────────────
# Syntax Highlighting Configuration (Material Theme)
# ─────────────────────────────────────────────────────────────
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#8AB4F8,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#bb86fc,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#03dac6,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#a5d6a7,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#fff59d,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ffecb3'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#8AB4F8'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#8AB4F8'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#646a73,italic'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#cf6679'

# ─────────────────────────────────────────────────────────────
# Completion System
# ─────────────────────────────────────────────────────────────
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Menu selection
zstyle ':completion:*' menu select

# Color completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group results by category
zstyle ':completion:*' group-name ''

# Better completion descriptions
zstyle ':completion:*:descriptions' format '%F{#bb86fc}── %d ──%f'
zstyle ':completion:*:warnings' format '%F{#cf6679}No matches found%f'

# Use cache for completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# ─────────────────────────────────────────────────────────────
# Key Bindings
# ─────────────────────────────────────────────────────────────
bindkey -e  # Emacs key bindings

# History search with arrow keys
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Delete key
bindkey '^[[3~' delete-char

# Home/End keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Ctrl+arrow keys
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Accept autosuggestion
bindkey '^ ' autosuggest-accept  # Ctrl+Space

# ─────────────────────────────────────────────────────────────
# Custom Prompt (Minimal & Professional)
# ─────────────────────────────────────────────────────────────
setopt PROMPT_SUBST
autoload -Uz vcs_info

# Git info configuration
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{#cf6679}*%f'
zstyle ':vcs_info:*' stagedstr '%F{#a5d6a7}+%f'
zstyle ':vcs_info:git:*' formats ' %F{#646a73}[%f%F{#8AB4F8}%b%f%u%c%F{#646a73}]%f'
zstyle ':vcs_info:git:*' actionformats ' %F{#646a73}[%f%F{#8AB4F8}%b%f%F{#646a73}|%f%F{#cf6679}%a%f%F{#646a73}]%f'

# Function to get git info
precmd() {
    vcs_info
}

# Minimal prompt with condensed path
PROMPT='%F{#fff59d}%2~%f${vcs_info_msg_0_} %F{#03dac6}›%f '

# Right prompt shows error status only when needed
RPROMPT='%(?..%F{#cf6679}✗%f)'

# ─────────────────────────────────────────────────────────────
# Better Directory Navigation
# ─────────────────────────────────────────────────────────────
# Quick directory jumps
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Directory stack navigation
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# ─────────────────────────────────────────────────────────────
# Enhanced ls with colors
# ─────────────────────────────────────────────────────────────
export LS_COLORS='di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;34:ow=1;34'

# ╔═══════════════════════════════════════════════════════════╗
# ║                       ALIASES                             ║
# ╚═══════════════════════════════════════════════════════════╝

# File operations
alias ls='ls -a --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias c='clear'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# System
alias off='poweroff'
alias reboot='sudo reboot'
alias ema='emacs -nw'
alias chrome-de='LANG=de-DE.UTF-8 chromium'
alias btop='glances'
alias langde='setxkbmap de'
alias langus='setxkbmap us'
alias merge='xrdb ~/.Xresources'

# Package management
alias install='sudo apt install -y'
alias search='sudo apt search'
alias update='sudo apt update && sudo apt upgrade -y'
alias remove='sudo apt remove'
alias autoremove='sudo apt autoremove -y'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate'
alias clone='git clone --depth 1'

# Development
alias py='python3'
alias pip='pip3'
alias serve='python3 -m http.server'
alias venv='python3 -m venv'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Shortcuts
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'

# ─────────────────────────────────────────────────────────────
# Utility Functions
# ─────────────────────────────────────────────────────────────

# Make directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract archives
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz) tar xzf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xf "$1" ;;
            *.tbz2) tar xjf "$1" ;;
            *.tgz) tar xzf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *) echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick file search
ff() {
    find . -type f -name "*$1*"
}

# Quick directory search
fd() {
    find . -type d -name "*$1*"
}

# ─────────────────────────────────────────────────────────────
# Load local configuration
# ─────────────────────────────────────────────────────────────
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
