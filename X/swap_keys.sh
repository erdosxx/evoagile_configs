#!/bin/sh

# Swap Escape and Shift_R keys
xmodmap -e "keycode 9 = Shift_R"
xmodmap -e "keycode 62 = Escape"

# Swap backslash(\ and bar |) and grave(` and notsign ¬) keys
# To apply this, just swap 3rd and 4th column(* column) with desired keysims.
# To keep original setting as possible, just keep 1st and 2nd column keysyms.
#
# original setting: 49 = grave asciitilde *grave* *notsign* bar bar
xmodmap -e "keycode 49 = grave asciitilde backslash bar bar bar"
# original setting: 94 = less greater *backslash* *bar* bar brokenbar bar brokenbar
xmodmap -e "keycode 94 = less greater grave notsign bar brokenbar bar brokenbar"
