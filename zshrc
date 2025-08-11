HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

export EDITOR="vim"

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

if [ -f "$HOME/.zsh_plugins.sh" ]; then
    alias antibodybuild="antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh"
    source ~/.zsh_plugins.sh
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

if (( ! $+commands[apk] )); then
    alias ls="ls -G"
fi

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
if (( $+commands[gh] )); then
  if gh extension list | grep -q "copilot"; then
    eval "$(gh copilot alias -- zsh)"
  fi 
fi

# Configure 1password cli completion
if (( $+commands[op] )); then
    eval "$(op completion zsh)"; compdef _op op
fi

# Configure tms cli completion
if (( $+commands[tms] )); then
    source <(COMPLETE=zsh tms)
fi

# Remove shared history
unsetopt inc_append_history
unsetopt share_history

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/patrick.gardella/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/patrick.gardella/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/patrick.gardella/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/patrick.gardella/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

## Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Created by `pipx` on 2025-04-15 20:23:46
export PATH="$PATH:/Users/patrick.gardella/.local/bin"

if [ -f "$HOME/.local/bin/env" ]; then
   . "$HOME/.local/bin/env"
fi

if [ -d "$HOME/Documents/projects/neo" ]; then
   alias neo="source ~/Documents/projects/neo/.venv/bin/activate && neo"
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
      eval $(ssh-agent -s)
fi
