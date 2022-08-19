#! /bin/bash
########## Variables

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLDDIR=~/dotfiles_old             # old dotfiles backup directory
FILES=".bashrc .tmux.conf .amethyst .editorconfig .tool-versions .psqlrc"
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

# nvim and tmux should be installed by asdf.  install vim-plug and symlink nvim config
mkdir -p ~/.config/nvim
if [ ! -f ~/.config/nvim/init.vim ]; then
  ln -s $DIR/.config/nvim/init.vim ~/.config/nvim/init.vim
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# install tmux plugin manager if the directory doesn't already exist
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
