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

if [ command -v ~/.cargo/env &>/dev/null ]; then
  . "$HOME/.cargo/env"
fi

if [ command -v ~/.local/bin/env &>/dev/null ]; then
  . "$HOME/.local/bin/env"
fi
