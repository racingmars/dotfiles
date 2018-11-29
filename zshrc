
# History configuration
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory histignoredups histsavenodups histignorespace
bindkey '^R' history-incremental-search-backward

# Prompt
setopt promptsubst
PS1='[%h] ${SSH_CONNECTION+"%n@%m:"}%~%# '

# Completion
autoload -Uz compinit
compinit
setopt magic_equal_subst

which kubectl &>/dev/null && source <(kubectl completion zsh)

[[ -x $HOME/lib/google-cloud-sdk/bin ]] &&
    source $HOME/lib/google-cloud-sdk/completion.zsh.inc

# Misc
export EDITOR=vim
export VISUAL=vim

# Aliases
alias ls='ls -F'
alias ffeh='feh -F -D 5 -z'
alias vi='vim'
alias horizons='telnet horizons.jpl.nasa.gov 6775'
alias lb='ledger -f ledger.dat --exchange \$ bal assets equity'

# Functions
function kubelog () {
    kubectl -nplatform logs -f $(kubectl -nplatform get pods | grep ^${1}- | awk '{print $1}')
}

# Platform settings
if [[ -f $HOME/lib/dotfiles/platforms/$(uname -s)/zshrc-after ]]; then
  source $HOME/lib/dotfiles/platforms/$(uname -s)/zshrc-after
fi

# Local settings
if [[ -f $HOME/lib/dotfiles/hosts/`uname -n`/zshrc-after ]]; then
  source $HOME/lib/dotfiles/hosts/`uname -n`/zshrc-after
fi

