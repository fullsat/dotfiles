#!/bin/sh

# NeoBundleをインストール
echo "$(date) install neobundle"
if [ ! -e "~/.vim/bin/" ];then
  mkdir -p ~/.vim/bin/
fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
