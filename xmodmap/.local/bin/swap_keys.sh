#!/bin/sh

# After apply this, we can get following modifiers.
# xmodmap -pm
#
# xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):
# shift       Shift_L (0x32)
# lock        F9 (0x4b)
# control     Control_L (0x42)
# mod1        Alt_L (0x85),  Alt_L (0xcc),  Meta_L (0xcd)
# mod2        Num_Lock (0x4d)
# mod3        ISO_Level5_Shift (0xcb)
# mod4        Super_L (0x40),  Super_R (0x86),  Super_L (0xce),  Hyper_L (0xcf)
# mod5        ISO_Level3_Shift (0x5c)

# Apply swap ctrl <-> caps lock, Alt_L <-> Super_L
# Use Alt_R as Hangul, Ctrl_R as Hanja
#
# We can apply this as following command
# xmodmap -e "clear lock" -e "clear control" \
#   -e "keycode 66 = Control_L" -e "add control = Control_L Control_R"
# but I found that after setting keycode 37(original left commend key) = ISO_Level3_Shift
# ctrl(caps lock) does not work.
# So instead using this option, issue resolved.
setxkbmap -layout gb \
	-option "ctrl:swapcaps,altwin:swap_lalt_lwin,korean:ralt_hangul,korean:rctrl_hanja" \
	-model thinkpad # I think that model setting is useless

# Use F9 as Caps Lock
xmodmap -e "clear lock" -e "add lock = F9"

# Use left control key as ISO_Level3_Shift
# So using this key we can input fifth and sixth entry in keycode
# See keycode 94 case
xmodmap -e "keycode 37 = ISO_Level3_Shift"

# Use Shift_R as Escape
# We can also use keysym command as following
# xmodmap -e "keysym Shft_R = Escape"
xmodmap -e "clear shift" -e "keycode 62 = Escape" -e "add shift = Shift_L"

# keycode 49: assign key above tab key to \ | ` ¬
# `(grave): ISO_Level3_Shift(original ctrl) + this key
# ¬(notsign): ISO_Level3_Shift(original ctrl) + Shift + this key
#
# I found that third and fouth key in the following cannot be access
# with and modifer, so I just define them as NoSymbol.
xmodmap -e "keycode 49 = backslash bar NoSymbol NoSymbol grave notsign"

# Keycode 94: assign key in right of left shift key to ` ¬ ¦ |
# ¦(brokenbar): ISO_Level3_Shift(original ctrl) + this key
# |(brokenbar): ISO_Level3_Shift(original ctrl) + Shift + this key
xmodmap -e "keycode 94 = grave notsign NoSymbol NoSymbol brokenbar bar"

# Keycode 134: right option key in Keychron
xmodmap -e "keycode 134 = grave notsign"

# Keycode 135: menu key next to righ alt key
xmodmap -e "keycode 135 = grave notsign"

# €: ISO_Level3_Shift(original ctrl) + 4(keycode 13)
