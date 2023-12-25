#!/bin/sh

# Exit if the 'exa' command could not be found
if ! (( $+commands[eza] )); then
    echo "ERROR: 'eza' command not found"
    return
fi

# Create alias override commands using 'exa'
alias ls='eza --icons --group-directories-first'

# Use the --git flag if the installed version of exa supports git
# Related to https://github.com/ogham/exa/issues/978
if eza --version | grep -q '+git';
then
	alias ll='ls -lh --git'
else
	alias ll='ls -lh'
fi

alias la='ll -a'
alias tree='ll --tree --level=2'
