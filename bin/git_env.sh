#!/bin/bash

if [ -z $1 ];then
  echo "put your name"
  exit 1
fi

if [ -z $2 ];then
  echo "put your mail"
  exit 1
fi

name=$1
mailaddr=$2

export GIT_COMMITTER_NAME=$name
export GIT_AUTHOR_NAME=$name
export EMAIL="$mailaddr"

echo "GIT_COMMITTER_NAME=$GIT_COMMITTER_NAME"
echo "GIT_AUTHOR_NAME=$GIT_AUTHOR_NAME"
echo "EMAIL=$EMAIL"
