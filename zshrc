
# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory histignoredups histsavenodups

# Prompt
setopt promptsubst
PS1='[%h] ${SSH_CONNECTION+"%n@%m:"}%~%# '

# Completion
autoload -Uz compinit
compinit

# Misc
export EDITOR=vim
export VISUAL=vim

# Aliases
alias ls='ls -F'
alias vi='vim'

# Platform settings
if [[ -f $HOME/lib/dotfiles/platforms/$(uname -s)/zshrc-after ]]; then
  source $HOME/lib/dotfiles/platforms/$(uname -s)/zshrc-after
fi

# Local settings
if [[ -f $HOME/lib/dotfiles/hosts/`uname -n`/zshrc-after ]]; then
  source $HOME/lib/dotfiles/hosts/`uname -n`/zshrc-after
fi

