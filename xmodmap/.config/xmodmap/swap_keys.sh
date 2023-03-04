#!/bin/sh

# Swap Escape and Shift_R keys
# xmodmap -e "keycode 9 = Shift_R"
# xmodmap -e "keycode 62 = Escape"

# Use Shift_R as Escape
xmodmap -e "keysym Shift_R = Escape"

# Swap backslash(\ and bar |) and grave(` and notsign ¬) keys
# To apply this, just swap 3rd and 4th column(* column) with desired keysims.
# To keep original setting as possible, just keep 1st and 2nd column keysyms.
#
# original setting: 49 = grave asciitilde *grave* *notsign* bar bar
xmodmap -e "keycode 49 = grave asciitilde backslash bar bar bar"
# original setting: 94 = less greater *backslash* *bar* bar brokenbar bar brokenbar
xmodmap -e "keycode 94 = less greater Hangul_Hanja Hangul_Hanja bar brokenbar bar brokenbar"

# Use right ctrl for grave and notsign
xmodmap -e "keycode 105 = grave NoSymbol notsign grave"

# mapping ISO_Level3_Shift(Alt gr) key to Hangul.
xmodmap -e "keysym ISO_Level3_Shift = Hangul"

# Mapping F9 with 3rd level switch: For €, ¦
xmodmap -e "keysym F9 = ISO_Level3_Shift"
