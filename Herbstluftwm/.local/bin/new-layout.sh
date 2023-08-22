#!/bin/bash

# LN=$(dmenu -fn Hermit:bold -l 5 -g 5 -nb '#222222' -sb '#181818' -sf '#10713c' -nf '#b8b8b8' -p "Layout Name?: ")

# To fix messages are already gone issue.
sleep 0.1
printf "Layout Name?\n"
printf " : "
read -r LN "$'\n'"

herbstclient dump > ~/.config/herbstluftwm/layouts/"$LN"
