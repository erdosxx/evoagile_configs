bass source /etc/profile
if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_logo
end

function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold red
            echo N
        case insert
            set_color --bold green
            echo I
        case replace_one
            set_color --bold green
            echo R
        case visual
            set_color --bold brmagenta
            echo V
        case '*'
            set_color --bold red
            echo '?'
    end
    set_color normal
end

set -gx LANG "en_US.UTF-8"
set -gx LC_COLLATE "en_US.UTF-8"
set -gx GDRIVE_PATH "$HOME/gdrive"
set -gx MYVIMRC "$HOME/localgit/evoagile_configs/.vimrc"
set -gx MYNVIMRC "$HOME/localgit/evoagile_configs/init.vim"
set -gx MYNVIMLUARC "$HOME/.config/nvim/init.lua"
set -gx MYURXVTRC "$HOME/.config/urxvt/urxvt.config"

fish_add_path --move --prepend ~/.local/bin ~/.cargo/bin ~/bin ~/go/bin

abbr venv "source venv/bin/activate.fish"
abbr djy "ssh aidongju -Y"
abbr poy "ssh polaris -Y"

abbr vi nvim
abbr vim "vim -u $MYVIMRC"

abbr rxs "xrdb $HOME/.Xresources"
abbr ra ranger

# function fish_prompt
#     set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
#     set_color red --bold
#     printf "["
#     set_color yellow
#     printf "%s" "$USER"
#     set_color green
#     printf "@"
#     set_color blue
#     printf "%s" "$hostname"
#     set_color magenta
#     printf " %s" "$PWD"
#     set_color red
#     printf "]"
#     set_color green
#     printf "%s" (fish_vcs_prompt)
#     set_color normal
# end

source /usr/share/fish/completions/fzf.fish
source /usr/share/fzf/key-bindings.fish
