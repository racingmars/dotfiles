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

### Load platform-specific environment
if [[ -f "$HOME/lib/dotfiles/platforms/$($uname -s)/zshenv-before" ]]; then
  source "$HOME/lib/dotfiles/platforms/$($uname -s)/zshenv-before"
fi
###

### Load machine-specific environment
if [[ -f "$HOME/lib/dotfiles/hosts/$($uname -n)/zshenv-before" ]]; then
  source "$HOME/lib/dotfiles/hosts/$($uname -n)/zshenv-before"
fi
###

### Add sbin to path
[[ -e /usr/local/sbin && ! "$PATH" =~ "/usr/local/sbin" ]] &&
    PATH=$PATH:/usr/local/sbin
[[ -e /usr/sbin && ! "$PATH" =~ "/usr/sbin" ]] &&
    PATH=$PATH:/usr/sbin
[[ -e /sbin && ! "$PATH" =~ ":/sbin" ]] &&
    PATH=$PATH:/sbin
###

### Local random bins
[[ -e ${HOME}/lib/bin ]] &&
    PATH=${HOME}/lib/bin:$PATH

### Java
[[ -e $HOME/lib/jdk && -z "$JAVA_HOME" ]] && export JAVA_HOME=$HOME/lib/jdk
[[ -e /usr/lib/jvm/default && -z "$JAVA_HOME" ]] \
    && export JAVA_HOME=/usr/lib/jvm/default/bin
[[ -n "$JAVA_HOME" ]] && PATH=$JAVA_HOME/bin:$PATH

[[ -e $HOME/lib/ant && -z "$ANT_HOME" ]] && export ANT_HOME=$HOME/lib/ant
[[ -n "$ANT_HOME" ]] && PATH=$ANT_HOME/bin:$PATH

[[ -e $HOME/lib/maven && -z "$MAVEN_HOME" ]] &&
    export MAVEN_HOME=$HOME/lib/maven
[[ -n "$MAVEN_HOME" ]] && PATH=$MAVEN_HOME/bin:$PATH
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
###

### Go
[[ -e $HOME/lib/go && -z "$GOROOT" ]] && export GOROOT=$HOME/lib/go
[[ -e /usr/local/go && -z "$GOROOT" ]] && export GOROOT=/usr/local/go
[[ -n "$GOROOT" ]] && PATH=$GOROOT/bin:$PATH
[[ -d $HOME/src/go && -z "$GOPATH" ]] && export GOPATH=$HOME/src/go
[[ -n "$GOPATH" ]]  && PATH=$GOPATH/bin:$PATH
###

### .NET Core
[[ -x $HOME/lib/dotnetcore/current/dotnet ]] && 
    PATH=$HOME/lib/dotnetcore/current:$PATH &&
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
###

### Node.js
[[ -x $HOME/lib/nodejs ]] &&
    PATH=$HOME/lib/nodejs/bin:$PATH
export NPM_CONFIG_PREFIX=$HOME/lib/npm-global
PATH=$NPM_CONFIG_PREFIX/bin:$PATH
###

### Kubernetes
[[ -x $HOME/lib/kubernetes/client/bin ]] &&
    PATH=$HOME/lib/kubernetes/client/bin:$PATH
###

### Oracle tools
[[ -x $HOME/lib/sqldeveloper/sqldeveloper/bin ]] &&
    PATH=$HOME/lib/sqldeveloper/sqldeveloper/bin:$PATH
[[ -x $HOME/lib/sqlcl/bin ]] &&
    PATH=$HOME/lib/sqlcl/bin:$PATH
###

### gcloud SDK
[[ -x $HOME/lib/google-cloud-sdk/bin ]] &&
    PATH=$HOME/lib/google-cloud-sdk/bin:$PATH
###

### MacPorts
[[ -x /opt/local ]] &&
    PATH=/opt/local/bin:/opt/local/sbin:$PATH
###

# Don't allow pip to install packages outside of a virtualenv
export PIP_REQUIRE_VIRTUALENV=true

export PATH

### Load platform-specific environment
if [[ -f "$HOME/lib/dotfiles/platforms/$($uname -s)/zshenv-after" ]]; then
  source "$HOME/lib/dotfiles/platforms/$($uname -s)/zshenv-after"
fi
###

### Load machine-specific environment
if [[ -f "$HOME/lib/dotfiles/hosts/$($uname -n)/zshenv-after" ]]; then
  source "$HOME/lib/dotfiles/hosts/$($uname -n)/zshenv-after"
fi
###

