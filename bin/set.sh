#!/bin/bash

BACKUPDATE=$(date +%Y%m%d%H%M%S)
BASEDIR="$(cd $(dirname $0) && pwd)/.."


# zshの追加補間
echo "[$(date)] install zsh-completions"
if [ "$(uname)" == "Darwin" ];then
  brew install zsh-completions
fi

# コマンドラインにgit の情報を表示させる
echo "[$(date)] install git-prompt"
if [ ! -e  ~/.zsh/prompt/git-prompt.sh ]; then
  mkdir -p ~/.zsh/prompt/
  cd ~/.zsh/prompt/ && wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/plugins/gitfast/git-prompt.sh 
  cd $BASEDIR
fi

# ホームディレクトリにシンボリックリンクを貼る
echo "[$(date)] symlink dotfiles"
function linkFile(){
  local SRCFILE=$1
  local DSTFILE=$2
 
  echo "symlink ${SRCFILE} to ${DSTFILE}"
  ln -s ${SRCFILE} ${DSTFILE}
}

# すでにシンボリックリンクが貼られていれば飛ばす
# 既存のものはバックアップを取っておく
function setFile() {
  local SRCFILE=$1
  local DSTFILE=$2

	if [ -L "$DSTFILE" ]; then
		echo "$DSTFILE already exists"
	elif [ ! -e "$DSTFILE" ];then
			linkFile $SRCFILE $DSTFILE
	else
    if [ -e "${DSTFILE}.${BACKUPDATE}" ]; then
      echo "${DSTFILE} already exists"
    else
      echo "backup ${DSTFILE} to ${DSTFILE}.${BACKUPDATE}"
      mv ${DSTFILE} ${DSTFILE}.${BACKUPDATE}
      linkFile $SRCFILE $DSTFILE 
    fi
  fi
}

for f in ".zshrc" ".tmux.conf" ".gitconfig";
do
  setFile "$BASEDIR/$f" "$HOME/$f"
done

# NeoBundleをインストール
echo "$(date) install neobundle"
if [ ! -e "~/.vim/bin/" ];then
  mkdir -p ~/.vim/bin/
fi
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > ~/.vim/bin/install.sh
sh ~/.vim/bin/install.sh


