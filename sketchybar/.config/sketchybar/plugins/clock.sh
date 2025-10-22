#!/bin/sh

if [ "$BUTTON" = "left" ]; then
  open -a Calendar
fi

sketchybar --set "$NAME" label="$(date '+%d/%m %H:%M')"

