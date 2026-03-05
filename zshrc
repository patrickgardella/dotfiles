HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

export EDITOR="vim"

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items

setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match


if [ -f "$HOME/.zsh_plugins.sh" ]; then
    alias antibodybuild="antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh"
    source ~/.zsh_plugins.sh
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

autoload -Uz compinit
compinit

if (( ! $+commands[apk] )); then
    alias ls="ls -G"
fi

alias brewup='brew update; brew upgrade; brew upgrade --cask; brew cleanup'

# Set window title
function set_win_title(){
    echo -ne "\033]0; $(basename "$HOST") \007"
}

starship_precmd_user_func="set_win_title"

# Configure command line prompt
# . /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
eval "$(starship init zsh)"

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


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

## Cargo and Rust
# Configure Cargo & Rust
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

## Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.local/bin"

if [ -d "$HOME/.local/share/nvim/mason/bin" ]; then
   export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
fi


if [ -f "$HOME/.local/bin/env" ]; then
   . "$HOME/.local/bin/env"
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
     # eval $(ssh-agent -s)
fi

# Added by LM Studio CLI (lms)
if [ -d "$HOME/.lmstudio/bin" ]; then
  export PATH="$PATH:$HOME/.lmstudio/bin"
fi

# opencode
if [ -d "$HOME/.opencode/bin" ]; then
  export PATH="$HOME/.opencode/bin:$PATH"
fi

# Map keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Machine-specific settings
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
