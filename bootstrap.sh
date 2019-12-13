#! /bin/bash
########## Variables

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLDDIR=~/dotfiles_old             # old dotfiles backup directory
FILES=".zshrc .vimrc .tmux.conf .amethyst .editorconfig"  # list of files/folders to symlink in homedir
##########

# Install homebrew and brew cask on osx if they aren't already installed
if ! type brew > /dev/null && [[ `uname` == 'Darwin' ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
  #brew tap caskroom/fonts
  brew tap buo/cask-upgrade
fi

# Install nix package manager if it isn't already installed.
# TODO: don't install if running nixos
# TODO: this has been a pain in the ass.  For now just install nix first and then run the script
# if ! type nix > /dev/null; then
  #curl https://nixos.org/nix/install | bash
  # source $SHELL
  # sudo launchctl start org.nixos.nix-daemon
# fi
# nix isn't on the path in the session after installing it
# refresh shell after installing nix. might be a better way to do this
# source $SHELL

if [[ `uname` == 'Darwin' ]] ; then
  # brew tap d12frosted/emacs-plus
  # brew install emacs-plus
  cat $DIR/brew_packages.txt | xargs brew install
  cat $DIR/brew_casks.txt | xargs brew cask install
fi

# install all nix packages in nix_packages.txt
cat $DIR/nix_packages.txt | xargs nix-env -i
# if [[ `uname` != 'Darwin' ]] ; then
  # cat $DIR/non_osx_nix_packages.txt | xargs nix-env -i
# fi
# cat $DIR/nix_packages.txt | xargs nix-env -i
# refresh shell after installing nix packages. might be a better way to do this
# source $SHELL

### !!!WARNING!!! ####
# THIS IS ANNOYING BECAUSE IT WILL START AN OH-MY-ZSH SHELL WHICH YOU WILL WANT TO EXIT TO FINISH THE SCRIPT
# thinking about ditching oh-my-zsh but it's working so far so I will have to revisit if it gets bad
if [ ! -d ~/.oh-my-zsh ]; then
  # if zsh wasn't installed at the beginning of the script, we install oh-my-zsh after it is brew installed
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
### !!!WARNING!!! ####

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

sudo npm -g install instant-markdown-d

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

source ~/.zshrc
vim +PackUpdate +qall

mkdir -p ~/.vim/colors
cp ~/.vim/pack/minpac/start/gruvbox/colors/gruvbox.vim ~/.vim/colors/

