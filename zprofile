# Homebrew — Apple Silicon
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew — Linux
if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# .NET Core SDK tools
[ -d "$HOME/.dotnet/tools" ] && export PATH="$PATH:$HOME/.dotnet/tools"

export PATH="$PATH:$HOME/.local/bin"

# Added by Obsidian
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"
fi
