#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export GDRIVE_PATH="$HOME/gdrive"

export MYVIMRC="$HOME/localgit/evoagile_configs/.vimrc"
export MYNVIMRC="$HOME/localgit/evoagile_configs/init.vim"
export MYNVIMLUARC="$HOME/.config/nvim/init.lua"
export MYURXVTRC="$HOME/.config/urxvt/urxvt.config"

export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="chromium"

export MANPAGER='nvim +Man!'
export MANWIDTH=999

export PATH="$HOME/.local/bin":$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$HOME/go/bin:$PATH
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/bin:$PATH
export PATH="$HOME/node_modules/.bin":$PATH
#export PATH="$PATH:./node_modules/.bin"
# eval "$(fnm env)"
eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"
