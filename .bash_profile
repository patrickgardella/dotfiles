unamestr=`uname`

if [ -f ~/.bashrc ]; then
	   source ~/.bashrc
fi

source ~/.profile

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Use bash-completion, if available
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  for COMPLETION in "$HOMEBREW_PREFIX"/etc/bash_completion.d/*
  do
    [[ -f $COMPLETION ]] && source "$COMPLETION"
  done
  if [[ -f ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh ]];
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  fi
fi

# Make command line pretty
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWCOLORHINTS=true
export PS1='\[\033[00;32m\]\u@\h \[\033[00;34m\]\W\[\033[0;31m\]$(__git_ps1) \[\033[01;35m\]$\[\033[0;39m\]'

# Add support for node CLI tools
export PATH=$PATH:/opt/nodejs/bin
