#! /bin/bash
########## Variables

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLDDIR=~/dotfiles_old             # old dotfiles backup directory
FILES=".bashrc .vimrc .tmux.conf .amethyst .editorconfig"  # list of files/folders to symlink in homedir
##########

# create dotfiles_old in homedir
echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $FILES; do
  echo "Moving any existing dotfiles from ~ to $OLDDIR"
  mv ~/$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $DIR/$file ~/$file
done

# install tmux plugin manager if the directory doesn't already exist
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ -f ~/.vim/pack/minpac/opt/minpac/README.md ];
then
  echo "minpac already installed"
else
  echo "Installing minpac"
  mkdir -p ~/.vim/pack/minpac/opt
  git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac

fi

vim +PackUpdate +qall
