
# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory histignoredups histsavenodups histignorespace
bindkey '^R' history-incremental-search-backward

# Prompt
setopt promptsubst
PS1='[%h] ${SSH_CONNECTION+"%n@%m:"}%~%# '

# Completion
autoload -Uz compinit
compinit
setopt magic_equal_subst

which kubectl >/dev/null && source <(kubectl completion zsh)

# Misc
export EDITOR=vim
export VISUAL=vim

# Aliases
alias ls='ls -F'
alias ffeh='feh -F -D 5 -z'
alias vi='vim'

alias lb='ledger -f ledger.dat --exchange \$ bal assets equity'

# Platform settings
if [[ -f $HOME/lib/dotfiles/platforms/$(uname -s)/zshrc-after ]]; then
  source $HOME/lib/dotfiles/platforms/$(uname -s)/zshrc-after
fi

# Local settings
if [[ -f $HOME/lib/dotfiles/hosts/`uname -n`/zshrc-after ]]; then
  source $HOME/lib/dotfiles/hosts/`uname -n`/zshrc-after
fi

