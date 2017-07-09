#! /bin/bash
########## Variables

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLDDIR=~/dotfiles_old             # old dotfiles backup directory
FILES=".zshrc .vimrc .tmux.conf .amethyst .spacemacs .thymerc"  # list of files/folders to symlink in homedir
ZSH_INSTALLED=false && (type zsh > /dev/null && [[ `uname` == 'Darwin' ]]) && zsh_installed=true
##########

# Install homebrew and brew cask on osx if they aren't already installed

if ! type brew > /dev/null && [[ `uname` == 'Darwin' ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
  brew tap buo/cask-upgrade
fi

if [[ `uname` == 'Darwin' ]] ; then
  # brew tap d12frosted/emacs-plus
  # brew install emacs-plus
  cat $DIR/brew_packages.txt | xargs brew install
  cat $DIR/brew_casks.txt | xargs brew cask install
fi

if [ "$ZSH_INSTALLED" == false ]; then
  # if zsh wasn't installed at the beginning of the script, we install oh-my-zsh after it is brew installed
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

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

pip install virtualenv
pip install virtualenvwrapper
gem install thyme
# installing spacemacs configuration
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo npm -g install instant-markdown-d

# install tmux plugin manager if the directory doesn't already exist
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ -f ~/.vim/bundle/vundle/README.md ];
then
  echo "Vundle already installed"
else
  echo "Installing Vundle"
  mkdir -p ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
fi

source ~/.zshrc
vim +PluginInstall +qall
vim +PluginUpdate +qall

mkdir -p ~/.vim/colors
cp ~/.vim/bundle/gruvbox/colors/gruvbox.vim ~/.vim/colors/

