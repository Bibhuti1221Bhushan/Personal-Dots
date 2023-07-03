
#  ███████╗███████╗██╗  ██╗███████╗███╗   ██╗██╗   ██╗
#  ╚══███╔╝██╔════╝██║  ██║██╔════╝████╗  ██║██║   ██║
#    ███╔╝ ███████╗███████║█████╗  ██╔██╗ ██║██║   ██║
#   ███╔╝  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
#  ███████╗███████║██║  ██║███████╗██║ ╚████║ ╚████╔╝ 
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  

# EXPORT TERM VARIABLE
export LESSHISTFILE="-"
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups

# SETTING ENVIRONMENT VARIABLES
export ZDOTDIR="$HOME/.config/zsh"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"

# MAN PAGE IN COLOR HIGHLIGHT
export MANPAGER="less -R --use-color -Dd+r -Du+b"
