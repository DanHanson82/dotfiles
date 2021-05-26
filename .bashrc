if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

set -o vi

. $HOME/.asdf/asdf.sh

# messing with my prompt.  still needs work
PS1='\w ¯\_(ツ)_/¯ '
export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]\ "

# increase history
HISTSIZE=20000
HISTFILESIZE=20000

if [ -f ~/.config/bash_aliases/special ]; then
  . ~/.config/bash_aliases/special
else
  . ~/.config/bash_aliases/default
fi
