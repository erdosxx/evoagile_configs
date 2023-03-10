#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

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
export TERMINAL="urxvt"
export BROWSER="brave-bin"

export MANPAGER='nvim +Man!'
export MANWIDTH=999

export GOPATH=$HOME/.local/share/go

# Show every matching package without number of limitation.
export EIX_LIMIT=0

export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.cargo/bin"
export PATH=$PATH:"$HOME/.local/share/go/bin":"$HOME/go/bin"
export PATH=$PATH:"$HOME/node_modules/.bin"
export PATH=$PATH:"$HOME/.luarocks/bin"

# eval "$(fnm env)"
eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"
