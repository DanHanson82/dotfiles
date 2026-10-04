#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILES=".bashrc .vimrc .tmux.conf .editorconfig .psqlrc .rgignore"

cd $DIR

for file in $FILES; do
  ln -s $DIR/$file ~/$file
done

# setup bash aliases
ALIAS_FILES="base  default  docker"
for file in $ALIAS_FILES; do
  if [ ! -f ~/.config/bash_aliases/$file ]; then
    ln -s $DIR/.config/bash_aliases/$file ~/.config/bash_aliases/$file
  fi
done

if [ ! -f ~/.config/nvim/init.vim ]; then
  ln -s $DIR/.config/nvim/ ~/.config/
fi


# install tmux plugin manager if the directory doesn't already exist
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
