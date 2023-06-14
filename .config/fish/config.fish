if status is-interactive
set -U fish_greeting
fish_add_path -g ~/.local/bin ~/bin /usr/local/sbin
end
 
alias cat="bat"
alias cdc="cd ~/Downloads/Repos"

Color-Bars
starship init fish | source