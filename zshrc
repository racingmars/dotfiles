
# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory histignoredups histsavenodups

# Prompt
setopt promptsubst
PS1='${SSH_CONNECTION+"%n@%m:"}%~%# '

# Aliases
alias ls='ls -F'
alias vi='vim'

# Local settings
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

