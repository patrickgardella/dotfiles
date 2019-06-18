unamestr=`uname`

if [ -f ~/.bashrc ]; then
	   source ~/.bashrc
fi

source ~/.profile

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

if [ "$unamestr" == 'Darwin' ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Add support for node CLI tools
export PATH=$PATH:/opt/nodejs/bin
