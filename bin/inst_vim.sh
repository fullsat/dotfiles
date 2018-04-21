#!/bin/sh

# NeoBundleをインストール
echo "$(date) install neobundle"
if [ ! -e "~/.vim/bin/" ];then
  mkdir -p ~/.vim/bin/
fi
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > ~/.vim/bin/install.sh
sh ~/.vim/bin/install.sh

