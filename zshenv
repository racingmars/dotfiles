if [[ -e ${HOME}/lib/jdk ]]; then
  export JAVA_HOME=${HOME}/lib/jdk
fi

if [[ -n "$JAVA_HOME" ]]; then
  PATH=${JAVA_HOME}/bin:${PATH}
fi

export PATH
