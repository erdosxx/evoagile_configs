#!/bin/sh
alias j='z'
alias f='zi'
alias g='lazygit'
alias nvk='nvim ~/.config/nvim/lua/user/keymaps.lua'
alias nvp='nvim ~/.config/nvim/lua/user/plugins.lua'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

alias venv="source venv/bin/activate"
alias djy="ssh aidongju -Y"
alias poy="ssh polaris -Y"
alias hpoy="ssh polaris_home -Y"
alias mby="ssh erdos@mbp -Y"
alias hmby="ssh erdos@mbp_home -Y"
alias niy="ssh nia_gpu -Y"

alias vi="nvim"
alias vim="vim -u $MYVIMRC"

alias rxs="xrdb $HOME/.Xresources"
alias ra="ranger"

alias dict="mdic.sh"
alias lf="lfct"

alias obsc="cd $GDRIVE_PATH && grive -s Obsidian && cd -"

# alias lf="lfub"
