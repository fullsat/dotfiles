#!/bin/bash

BACKUPDATE=$(date +%Y%m%d%H%M%S)
BASEDIR="$(cd $(dirname $0) && pwd)/.."

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

for f in ".zshrc" ".tmux.conf" ".gitconfig" ".vimrc";
do
  setFile "$BASEDIR/$f" "$HOME/$f"
done

