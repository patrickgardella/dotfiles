unamestr=`uname`

if [ -f ~/.bashrc ]; then
	   source ~/.bashrc
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

## Mac Specific Stuff
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

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

## Configure Starship
eval "$(starship init bash)"

if [ -d /home/patrick/.local/bin ]; then
  export PATH=$PATH:$HOME/.local/bin
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
      eval $(ssh-agent -s)
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/patrick.gardella/.lmstudio/bin"
# End of LM Studio CLI section

