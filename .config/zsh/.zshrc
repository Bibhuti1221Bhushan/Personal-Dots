
#  ███████╗███████╗██╗  ██╗██████╗  ██████╗
#  ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#    ███╔╝ ███████╗███████║██████╔╝██║     
#   ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
#  ███████╗███████║██║  ██║██║  ██║╚██████╗
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

# IF NOT RUNNING INTERACTIVELY, DON'T DO ANYTHING
[[ $- != *i* ]] && return

# CONFIGURING $PATH
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/scripts:/usr/local/bin:$PATH

# SOURCING ALIAS FILE
[ -f "${XDG_CONFIG_HOME}/zsh/aliasrc" ] && source "${XDG_CONFIG_HOME}/zsh/aliasrc"

# SETTING DEFAULTS
export EDITOR='nvim'       # --SET NEOVIM AS DEFAULT TERMINAL EDITOR
export VISUAL='nvim'       # --SET NEOVIM AS DEFAULT VISUAL EDITOR

# HISTORY IN CUSTOM DIRECTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/.zsh_history

# EXPORT ZSH PLUGINS FOLDER 
export ZSH="/usr/share/zsh/plugins/" 

# UNSET OPTIONS
unsetopt menu_complete
unsetopt flowcontrol

# SET OPTIONS
setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# AUTOLOAD 
autoload -U compinit 
compinit

# SOURCE ZSH PLUGINS
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zstyle ':completion:*' menu select

# KEYBINDS - HISTORY SUBSTRING SEARCH OPTIONS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black, fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=lightgreen, fg=black,bold'

# KEYBINDS - MOVE CURSOR
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# ZSH SHELL PROMPT 
setopt PROMPT_SUBST
# precmd() { print "" }  

# PROMPT ➜ DIR 
# PROMPT="%F{87}➜ %f%B%~%b "   

# PROMPT DIR ➜
PROMPT="%B%~%b%B%F{87} ➜%f%b "

# PROMPT DIR ❯
# PROMPT='%B%40<..<%~ %b' \
# PROMPT+='%(?.%(!.%F{white}❯%F{yellow}❯%F{red}.%F{red}❯)%f '

# █▀▄▀█   █   █▀    █▀▀
# █ ▀ █   █   ▄█    █▄▄

# DT COLOR SCRIPTS
Color-Bars

# STARSHIP PROMPT
eval "$(starship init zsh)"
