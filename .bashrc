if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

set -o vi

. $HOME/.asdf/asdf.sh

PS1='[\D{%Y-%m-%d %H:%M:%S}]\w ¯\_(ツ)_/¯ '

# increase history
HISTSIZE=20000
HISTFILESIZE=20000

if [ -f ~/.config/bash_aliases/special ]; then
  . ~/.config/bash_aliases/special
else
  . ~/.config/bash_aliases/default
fi
