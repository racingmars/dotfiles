### ZSH environment
### Matthew R. Wilson <mwilson@mattwilson.org>

## The following environment variables will be set. If they already
## exist, they will not be altered. PATH will be updated appropriately
## in all cases, so PATH to overwritten (e.g. non-default) locations
## should not be set. (E.g. if you set a custom JAVA_HOME in an
## override file, don't add that custom location to PATH, we'll still
## take care of that here.

# If re-sourcing this environment file, we want to restore the original
# login path first so we don't end up re-building with tons of duplicate
# entries.

# In Cygwin, uname isn't on the path yet, so let's shoot for an explicit
# full path.
if [[ -x /usr/bin/uname ]]; then
  uname=/usr/bin/uname
else
  uname=uname
fi

if [[ -z "$ORIG_PATH" ]]; then
  export ORIG_PATH=$PATH
else
  export PATH=$ORIG_PATH
  if [[ -x /usr/libexec/path_helper ]]; then
    eval `/usr/libexec/path_helper -s`
  fi
fi

### Load machine-specific environment
if [[ -f "$HOME/lib/dotfiles/hosts/$($uname -n)/zshenv-before" ]]; then
  source "$HOME/lib/dotfiles/hosts/$($uname -n)/zshenv-before"
fi
###

### Java
[[ -e $HOME/lib/jdk && -z "$JAVA_HOME" ]] && export JAVA_HOME=$HOME/lib/jdk
[[ -n "$JAVA_HOME" ]] && PATH=$JAVA_HOME/bin:$PATH
###

### Go
[[ -e $HOME/lib/go && -z "$GOROOT" ]] && export GOROOT=$HOME/lib/go
[[ -n "$GOROOT" ]] && PATH=$GOROOT/bin:$PATH
[[ -d $HOME/src/go && -z "$GOPATH" ]] && export GOPATH=$HOME/src/go
[[ -n "$GOPATH" ]]  && PATH=$GOPATH/bin:$PATH
###

export PATH

### Load machine-specific environment
if [[ -f "$HOME/lib/dotfiles/hosts/$($uname -n)/zshenv-after" ]]; then
  source "$HOME/lib/dotfiles/hosts/$($uname -n)/zshenv-after"
fi
###

