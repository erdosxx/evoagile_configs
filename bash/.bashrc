# /etc/skel/.bashrc
#

LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi

# Put your fun stuff here.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="[\[\e[1;32m\]\u\[\e[m\]@\[\e[1;35m\]\h\[\e[1;34m\]:\w\[\033[33m\]\$(parse_git_branch)\[\e[m\]]$ "

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

export GDRIVE_PATH="$HOME/gdrive/"

alias venv="source venv/bin/activate"
alias djy="ssh aidongju -Y"
alias poy="ssh polaris -Y"

export MYVIMRC="$HOME/localgit/evoagile_configs/.vimrc"
alias vi="vim -u $MYVIMRC"
alias vim="vim -u $MYVIMRC"

export MYURXVTRC="$HOME/.config/urxvt/urxvt.config"
alias rxs="xrdb $HOME/.Xresources"
alias ra="ranger"

# Use fish in place of bash
# keep this line at the bottom of ~/.bashrc
[ -x /bin/bash ] && SHELL=/bin/fish exec fish
