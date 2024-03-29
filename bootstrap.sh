#! /bin/bash
########## Variables

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLDDIR=~/dotfiles_old             # old dotfiles backup directory
FILES=".bashrc .tmux.conf .amethyst .editorconfig .tool-versions .psqlrc .rgignore"
##########

## make backups if files exist
mkdir -p $OLDDIR
cd $DIR

## move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $FILES; do
  if [ -f ~/$file ]; then
    mv ~/$file ~/dotfiles_old/
  fi
  ln -s $DIR/$file ~/$file
done

# install asdf if it isn't already installed
if [ ! -f $HOME/.asdf/asdf.sh ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
fi
# add plugins and install defaults from .tool-versions.  This will include nvim and tmux

# setup bash aliases
mkdir -p ~/.config/bash_aliases
ALIAS_FILES="base  default  docker"
for file in $ALIAS_FILES; do
  if [ ! -f ~/.config/bash_aliases/$file ]; then
    ln -s $DIR/.config/bash_aliases/$file ~/.config/bash_aliases/$file
  fi
done

# nvim and tmux should be installed by asdf.  Also, install treesitter-cli
# install rust and then run the following to install a working version of tree-sitter-cli
# cargo install tree-sitter-cli --git https://github.com/tree-sitter/tree-sitter.git
# install one of these for the correct file icons https://www.nerdfonts.com/font-downloads
if [ ! -f ~/.config/nvim/init.vim ]; then
  ln -s $DIR/.config/nvim/ ~/.config/
fi


# install tmux plugin manager if the directory doesn't already exist
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
