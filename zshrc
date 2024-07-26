HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

# Configure Antibody
#source <(antibody init)
#antibody bundle < ~/.zsh_plugins
alias antibodybuild="antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh"
source ~/.zsh_plugins.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

alias ls="ls -G"
alias brewup='brew update; brew upgrade; brew cask upgrade; brew cleanup'

# Set window title
function set_win_title(){
    echo -ne "\033]0; $(basename "$HOST") \007"
}

starship_precmd_user_func="set_win_title"

# Configure command line prompt
# . /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
eval "$(starship init zsh)"

# Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
compresspdf() {
  gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

# Configure Github copilot
eval "$(gh copilot alias -- zsh)"

# Configure 1password cli completion
eval "$(op completion zsh)"; compdef _op op
