# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/.nix-profile/bin:$PATH"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

bindkey -v

#alias t='thyme'
alias bam='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf \;'


export WORKON_HOME=~/venvs
source /usr/local/bin/virtualenvwrapper.sh
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"

#. $HOME/.asdf/asdf.sh

#. $HOME/.asdf/completions/asdf.bash
