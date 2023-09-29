#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export GDRIVE_PATH="$HOME/gdrive"

export MYVIMRC="$HOME/.vimrc"
export MYNVIMLUARC="$HOME/.config/nvim/init.lua"
export MYURXVTRC="$HOME/.config/urxvt/urxvt.config"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=/tmp/"runtime-$(whoami)"

export EDITOR="nvim"
export TERMINAL="$HOME/.local/bin/st"
export BROWSER="brave-bin"

export MANPAGER='nvim +Man!'
export MANWIDTH=999

export GOPATH=$HOME/.local/share/go

# Show every matching package without number of limitation.
export EIX_LIMIT=0

export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/bin":$PATH
export PATH="$HOME/.cargo/bin":$PATH
export PATH="$GOPATH/bin":"$HOME/go/bin":$PATH
export PATH="$HOME/node_modules/.bin":$PATH
export PATH="$HOME/.luarocks/bin":$PATH

if [[ -f $HOME/.config/openai/api_key ]]; then
  export OPENAI_API_KEY=$(cat $HOME/.config/openai/api_key)
fi

# eval "$(fnm env)"
eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"

PRIVATE_EXPORTS="$HOME/.config/zsh/private_exports.zsh"
if [ -f $PRIVATE_EXPORTS ]; then
    source $PRIVATE_EXPORTS
fi
