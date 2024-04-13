# Aliases for simple command replacements
alias e='nvim'
alias p='pwd'

alias vd='nvim -d'
alias evim='nvim ~/.config/nvim'
alias ezellij='nvim ~/.config/zellij/config.kdl' # Changed the name to avoid conflict

# Directory navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias h='cd ~'
alias c='clear'
alias cds='cd /home/scratch.urmishs_vlsi'
alias cdc='cd /home/scratch.urmishs_vlsi/clients'
alias cdt='cd /home/scratch.urmishs_vlsi/tools'

# Listing and file management
alias ls='eza'
# alias ls='ls --color=auto'
# alias ll='ls --color=auto -l'
# alias la='ls --color=auto -A'
alias l='ls --color=auto -CF'
alias v='eza -l --sort=newest'
alias ll='eza -l'
alias la='eza -A'
# Commented interactive aliases can be uncommented if needed
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Misc commands
alias rmrf='rm -rf'
alias g='rg'
alias hig='history | rg'
alias envg='env | rg'
alias lg='ls | rg'
alias lc='wc -l'
alias rp='realpath'
alias tf='tail -f'

# System and Process Management
alias df='df -h'
alias du='du -h'
alias dus='du -hc --summarize'
alias psg='ps aux | rg'

alias cls='clear; ls'
alias path='echo $PATH | tr ":" "\n"'
alias ldpath='echo $LD_LIBRARY_PATH | tr ":" "\n"'

alias econfig='vim ~/.bashrc'
alias sconfig='source ~/.config/bash/functions.sh && source ~/.config/bash/aliases.sh && source ~/.config/bash/custom.sh && source ~/.config/bash/work.sh'
alias saliases='source ~/.config/bash/aliases.sh'
alias ealiases='vim ~/.config/bash/aliases.sh'

alias topu='top -u $USER'
# alias fish='source ~/.invoke_fish.bashrc'
