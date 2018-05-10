#!/bin/bash

# コマンドラインにgit の情報を表示させる
echo "[$(date)] install git-prompt"
if [ ! -e  ~/.zsh/prompt/git-prompt.sh ]; then
  mkdir -p ~/.zsh/prompt/
  cd ~/.zsh/prompt/ && wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/plugins/gitfast/git-prompt.sh 
  cd $BASEDIR
fi


