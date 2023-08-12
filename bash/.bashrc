#
# ~/.bashrc
#

# Set environment variables
export EDITOR=nvim
export HISTCONTROL=ignoreboth
export MANPAGER="nvim +Man!"
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH
export PS1="$(tput bold)$(tput setaf 5)\w\n$(tput setaf 2)> $(tput sgr0)"
export FZF_DEFAULT_OPTS="--reverse \
    --margin 10% \
    --info inline-right \
    --color 16,bg+:#222436"

# Enable colored completion prefix and stats display
bind "set colored-completion-prefix on"
bind "set colored-stats on"

# Ignore case during completion and show all options if ambiguous
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Custom cd function that also lists directory contents
function cd() {
    builtin cd "$@" || exit
    exa -a --color=always --group-directories-first
}

# Custom mc function to create a directory and move into it
function mc() {
    mkdir -p "$1"
    cd "$1" || exit
}

# Generate random sparks on terminal startup
randsparks

# Enable autocd and history appending
shopt -s autocd
shopt -s histappend

# Define aliases for common commands
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias :q="exit"
alias cat="bat -pp --theme base16"
alias clear="clear; randsparks"
alias cs="xclip -selection clipboard"
alias g="git"
alias grep="grep --color=always"
alias la="exa -a --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"
alias ls="exa -al --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"
alias vid="env -u WAYLAND_DISPLAY neovide --frame none --maximized --multigrid"
alias vim="nvim"
