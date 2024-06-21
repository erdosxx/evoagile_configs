#!/usr/bin/env sh

# xmodmap "$HOME/.config/xmodmap/xmodmap_origin.conf"
setxkbmap -layout gb -option ctrl:swapcaps -option altwin:swap_lalt_lwin -option korean:ralt_hangul -option korean:rctrl_hangul -model latitude
# setxkbmap -layout gb -option ctrl:swapcaps -option korean:ralt_hangul -option korean:rctrl_hangul -model apple

sh "$HOME/.local/bin/swap_keys.sh"
# notify-send "Keymap reset to default"
