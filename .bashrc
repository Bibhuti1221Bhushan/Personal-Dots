
#  ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#  ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#  ██████╔╝███████║███████╗███████║██████╔╝██║     
#  ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#  ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
                                                
# IF NOT RUNNING INTERACTIVELY, DON'T DO ANYTHING
[[ $- != *i* ]] && return

# EXPORT TERM VARIABLE
export LESSHISTFILE="-"
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups

# SETTING DEFAULTS
export EDITOR='nvim'       # --SET NEOVIM AS DEFAULT TERMINAL EDITOR
export VISUAL='nvim'       # --SET NEOVIM AS DEFAULT VISUAL EDITOR

# CONFIGURING $PATH
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/scripts:/usr/local/bin:$PATH

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

# BASH SHELL PROMPT 
# PROMPT_COMMAND="echo """
# PS1='\[\e[38;5;121;1m\]\u\[\e[0m\] on \[\e[38;5;217;1m\]\h \[\e[0m\]- \[\e[38;5;81;1m\]\w\n\[\e[38;5;121m\]➜ \[\e[0m\]'

# DT COLOR SCRIPTS
Color-Bars

# STARSHIP PROMPT
eval "$(starship init bash)"


#  ▄▀█   █     █   ▄▀█   █▀
#  █▀█   █▄▄   █   █▀█   ▄█

# COMMONS ALIAS
alias cp="cp -f -r"
alias mv="mv -f -v"
alias rm="rm -f -r"
alias mkdir="mkdir -p -v"
alias grep='grep --color=always'

# CHANGING DEFAULT TO MODERN TOOLS
alias la='exa -a -s type'
alias ls="exa --group-directories-first"
alias ll="exa -l -a --group-directories-first"
alias cat='bat --number'

# SHUTDOWN COMMAND
alias shutdown='shutdown -h now --no-wall'
alias poweroff='shutdown -h now --no-wall'

# GET ERROR MESSAGES FROM JOURNALCTL
alias error="journalctl -p 3 -xb"

# TTY APPLICATION ALIAS
# alias vim="nvim"
alias nm="ncmpcpp"
alias clock='tty-clock -c -C 4 -t -D'
alias pipes='pipes.sh -t 9'
alias matrix='neo-matrix -D'
alias yta='youtube-dl --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3'
alias ytv='youtube-dl --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata'

# PACMAN ALIAS
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias update='sudo pacman -Syu'
alias pacache='du -sh /var/cache/pacman/pkg/'
alias clean='sudo paccache -r -k 1 && sudo pacman -Sc'

# PARU ALIAS
alias yay='paru'

# GIT ALIAS
alias gc='git clone'

# PERSONAL CONFY ALIAS
alias keys='sed -n l'
alias fonts='fc-cache -fv'
alias sddm-theme='sddm-greeter --test-mode --theme'
alias ttyfonts="ls -l /usr/share/kbd/consolefonts/ | grep -i ".psfu.gz""
alias mirror="sudo reflector --latest 30 --number 20 --protocol https --sort age --save /etc/pacman.d/mirrorlist"

# DOT-FILES & CONFIG ALIAS
alias cdc='cd $HOME/Downloads/Repos'
alias zconf="subl ~/.config/zsh/.zshrc"
