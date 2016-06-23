
# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory histignoredups histsavenodups

# Prompt
setopt promptsubst
PS1='${SSH_CONNECTION+"%n@%m:"}%~%# '

# Misc
export EDITOR=vim
export VISUAL=vim

# Aliases
alias ls='ls -F'
alias vi='vim'

# Local settings
if [[ -f $HOME/lib/dotfiles/hosts/`uname -n`/zshrc-after ]] ; then source $HOME/lib/dotfiles/hosts/`uname -n`/zshrc-after ; fi

