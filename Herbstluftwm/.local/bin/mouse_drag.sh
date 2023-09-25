#!/usr/bin/env bash

BUTTON=$1
DIRECTION=$2
STEP=${3:-20}

case $BUTTON in
  left_button) bt_id=1;;
  middle_button) bt_id=2;;
  right_button) bt_id=3;;
esac

case $DIRECTION in
  up) degree=0;;
  right) degree=90;;
  down) degree=180;;
  left) degree=270;;
esac

xdotool click 1
xdotool mousedown "$bt_id"
xdotool mousemove_relative --polar "$degree" "$STEP"
xdotool mouseup "$bt_id"
