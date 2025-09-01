# Add .NET Core SDK tools
export PATH="$PATH:/Users/$USER/.dotnet/tools"

if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="$PATH:$HOME/.local/bin"
