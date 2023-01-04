# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

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

# Hangul input
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
#export GTK_IM_MODULE=uim
#export QT_IM_MODULE=uim
#export XMODIFIERS="@im=uim"

#if ! pgrep -x "ibus-daemon" > /dev/null
#then
#    ibus-daemon -drx
#fi

# Mouse scroll speed fix
#if ! pgrep -x "imwheel" > /dev/null
#then
#   imwheel
#fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/gentoo/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/gentoo/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/gentoo/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/gentoo/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

#export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="[\[\e[1;32m\]\u\[\e[m\]@\[\e[1;35m\]\h\[\e[1;34m\]:\w\[\033[33m\]\$(parse_git_branch)\[\e[m\]]$ "

export PATH="/home/gentoo/.local/bin:/home/gentoo/bin:$PATH"

export GDRIVE_PATH="/home/gentoo/gdrive/"

alias venv="source venv/bin/activate"
alias djy="ssh aidongju -Y"
alias poy="ssh polaris -Y"

export MYVIMRC="$HOME/localgit/evoagile_configs/.vimrc"
alias vi="vim -u $MYVIMRC"
alias vim="vim -u $MYVIMRC"

export MYURXVTRC="$HOME/.config/urxvt/urxvt.config"
alias rxs="xrdb $HOME/.Xresources"
alias ra="ranger"
