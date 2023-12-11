#!/usr/bin/env bash
#
## Created By: Jake@Linux
# Created On: Thu 27 Oct 2022 12:50:03 PM CDT
# # Project: conky viewer toggle
#

# choices: top, center, bottom, fixed
POS="${1:-top}"
# coices: large, medium, small
SIZE="${2:-medium}"

SK=$(pgrep -f "screenkey --position")

if [ -z "$SK" ]; then
   screenkey --position "$POS" --font-size "$SIZE"
else
   kill -QUIT "$SK"
fi
