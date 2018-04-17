#!/bin/bash

#brew install zsh-completions
BACKUPDATE=$(date +%Y%m%d%H%M%S)
BASEDIR="$(cd $(dirname $0) && pwd)/.."

if [ ! -e  ~/.zsh/prompt/git-prompt.sh ]; then
  mkdir -p ~/.zsh/prompt/
  cd ~/.zsh/prompt/ && wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/plugins/gitfast/git-prompt.sh 
  cd $BASEDIR
fi

function linkFile(){
  local SRCFILE=$1
  local DSTFILE=$2
 
  echo "symlink ${SRCFILE} to ${DSTFILE}"
  ln -s ${SRCFILE} ${DSTFILE}
}

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
