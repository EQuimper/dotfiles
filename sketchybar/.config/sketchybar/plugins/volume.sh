#!/usr/bin/env zsh

case ${INFO} in
0)
  ICON=""
  ICON_PADDING_RIGHT=21
  ;;
[0-9])
  ICON=""
  ICON_PADDING_RIGHT=12
  ;;
*)
  ICON=""
  ICON_PADDING_RIGHT=6
  ;;
esac

VOLUME=${INFO:-$(osascript -e "output volume of (get volume settings)")}

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label="$VOLUME%"
