if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

set -o vi

. $HOME/.asdf/asdf.sh

# running here but not sure if we want to keep this or expand it
alias gs='git status'

#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

PS1='\w => '
export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]\ "

# Add aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
