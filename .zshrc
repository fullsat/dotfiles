export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="michelebologna"
plugins=(git ruby bundler rails)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

source $HOME/.zsh.git
fpath=(~/.zsh/zsh-completins/src ${fpath})

alias unity="export MESA_GL_VERSION_OVERRIDE=3.2; /opt/Unity/Editor/Unity"
