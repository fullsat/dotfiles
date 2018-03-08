export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="michelebologna"
plugins=(git ruby bundler rails)

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh.git
fpath=(/usr/local/share/zsh-completins/ ${fpath})

setopt auto_menu 
setopt magic_equal_subst 
setopt print_eight_bit 
setopt globdots 
setopt list_packed
bindkey "^I" menu-complete
bindkey -v

alias ll="ls -l"
