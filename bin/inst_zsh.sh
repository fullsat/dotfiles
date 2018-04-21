#!/bin/sh

# zshの追加補間
echo "[$(date)] install zsh-completions"
if [ "$(uname)" == "Darwin" ];then
  brew install zsh-completions
fi
