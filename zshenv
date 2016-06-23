### ZSH environment
### Matthew R. Wilson <mwilson@mattwilson.org>

## The following environment variables will be set. If they already
## exist, they will not be altered. PATH will be updated appropriately
## in all cases, so PATH to overwritten (e.g. non-default) locations
## should not be set. (E.g. if you set a custom JAVA_HOME in an
## override file, don't add that custom location to PATH, we'll still
## take care of that here.

# TODO: Load environment overrides here

# Java

if [[ -e $HOME/lib/jdk && -z "$JAVA_HOME" ]]; then
  export JAVA_HOME=$HOME/lib/jdk
fi

if [[ -n "$JAVA_HOME" ]]; then
  PATH=$JAVA_HOME/bin:$PATH
fi

# Go

if [[ -e $HOME/lib/go && -z "$GOROOT" ]]; then
  export GOROOT=$HOME/lib/go
fi

if [[ -n "$GOROOT" ]]; then
  PATH=$GOROOT/bin:$PATH
fi

if [[ -d $HOME/src/go && -z "$GOPATH" ]]; then
  export GOPATH=$HOME/src/go
fi

if [[ -n "$GOPATH" ]]; then
  PATH=$GOPATH/bin:$PATH
fi

# Finish

export PATH

if [[ -f "$HOME/lib/dotfiles/hosts/`uname -n`/zshenv-after" ]]; then
  source "$HOME/lib/dotfiles/hosts/`uname -n`/zshenv-after"
fi

