########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".zshrc .vimrc .tmux.conf .amethyst"        # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

if [ -f "~/.vim/bundle/vundle/README.md" ];
then
  echo "Vundle already installed"
else
  echo "Installing Vundle"
  mkdir -p ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
fi

if [[ `uname` == 'Darwin' ]] ; then
  brew install the_silver_searcher
  brew install reattach-to-user-namespace
fi
        

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

nvim +PluginInstall +qall
