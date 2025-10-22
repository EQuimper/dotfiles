#!/bin/bash

STATE_FILE="/tmp/sketchybar_pomodoro_state"
# 15 minutes
DURATION=$((15 * 60))

ICON_IDLE="󱫜"
ICON_RUNNING="󰔟"
ICON_PAUSED="󰏤"

COLOR_IDLE="0xffcad3f5"
COLOR_RUNNING="0xffa6da95"
COLOR_WARNING="0xfff5a97f"
COLOR_FINISHED="0xffed8796"

get_state() {
  if [ -f "$STATE_FILE" ]; then
    cat "$STATE_FILE"
  else
    echo "idle:0"
  fi
}

save_state() {
  echo "$1" >"$STATE_FILE"
}

format_time() {
  local total_seconds=$1
  local minutes=$((total_seconds / 60))
  local seconds=$((total_seconds % 60))
  printf "%02d:%02d" $minutes $seconds
}

update_display() {
  local state=$1
  local remaining=$2
  local icon=$3
  local color=$4

  sketchybar --set "$NAME" \
    icon="$icon" \
    label="$(format_time $remaining)" \
    icon.color="$color" \
    label.color="$color"
}

if [ "$BUTTON" = "right" ]; then
  rm -f "$STATE_FILE"
  update_display "idle" $DURATION "$ICON_IDLE" "$COLOR_IDLE"
  exit 0
fi

if [ "$BUTTON" = "left" ]; then
  current_state=$(get_state)
  IFS=':' read -r state remaining start_time <<<"$current_state"

  if [ "$state" = "idle" ]; then
    save_state "running:$DURATION:$(date +%s)"
    update_display "running" $DURATION "$ICON_RUNNING" "$COLOR_RUNNING"
  elif [ "$state" = "running" ]; then
    now=$(date +%s)
    elapsed=$((now - start_time))
    new_remaining=$((remaining - elapsed))
    save_state "paused:$new_remaining"
    update_display "paused" $new_remaining "$ICON_PAUSED" "$COLOR_WARNING"
  elif [ "$state" = "paused" ]; then
    save_state "running:$remaining:$(date +%s)"
    update_display "running" $remaining "$ICON_RUNNING" "$COLOR_RUNNING"
  fi
  exit 0
fi

current_state=$(get_state)
IFS=':' read -r state remaining start_time <<<"$current_state"

if [ "$state" = "running" ]; then
  now=$(date +%s)
  elapsed=$((now - start_time))
  new_remaining=$((remaining - elapsed))

  if [ $new_remaining -le 0 ]; then
    rm -f "$STATE_FILE"
    update_display "finished" 0 "$ICON_IDLE" "$COLOR_FINISHED"
    osascript -e 'display notification "Pomodoro completed!" with title "Pomodoro Timer"'
    afplay /System/Library/Sounds/Glass.aiff
  else
    save_state "running:$new_remaining:$now"
    update_display "running" $new_remaining "$ICON_RUNNING" "$COLOR_RUNNING"
  fi
elif [ "$state" = "paused" ]; then
  update_display "paused" $remaining "$ICON_PAUSED" "$COLOR_WARNING"
else
  update_display "idle" $DURATION "$ICON_IDLE" "$COLOR_IDLE"
fi
