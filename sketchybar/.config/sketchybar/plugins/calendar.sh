#!/usr/bin/env zsh

# Get the next calendar event for today using icalBuddy
NEXT_EVENT=$(icalBuddy -n -li 1 -ea -nc -nrd -df "" -tf "%H:%M" eventsToday 2>/dev/null)

if [ -z "$NEXT_EVENT" ]; then
  sketchybar --set $NAME label="No events"
  exit 0
fi

# Extract event title and time
# icalBuddy output format: "• Event Title (HH:MM - HH:MM)"
EVENT_TITLE=$(echo "$NEXT_EVENT" | sed 's/^• //' | sed 's/ ([0-9].*$//')

# Truncate title to 20 characters
if [ ${#EVENT_TITLE} -gt 20 ]; then
  EVENT_TITLE="${EVENT_TITLE:0:20}…"
fi
EVENT_TIME=$(echo "$NEXT_EVENT" | grep -oE '\([0-9]{2}:[0-9]{2}' | head -1 | tr -d '(')

if [ -z "$EVENT_TIME" ]; then
  sketchybar --set $NAME label="$EVENT_TITLE"
  exit 0
fi

# Calculate time until event
CURRENT_MINUTES=$(($(date +%H) * 60 + $(date +%M)))
EVENT_HOUR=$(echo "$EVENT_TIME" | cut -d: -f1)
EVENT_MIN=$(echo "$EVENT_TIME" | cut -d: -f2)
EVENT_MINUTES=$((10#$EVENT_HOUR * 60 + 10#$EVENT_MIN))

DIFF=$((EVENT_MINUTES - CURRENT_MINUTES))

if [ $DIFF -lt 0 ]; then
  # Event is currently happening
  sketchybar --set $NAME label="$EVENT_TITLE (now)"
elif [ $DIFF -lt 60 ]; then
  sketchybar --set $NAME label="$EVENT_TITLE in ${DIFF}m"
else
  HOURS=$((DIFF / 60))
  MINS=$((DIFF % 60))
  if [ $MINS -eq 0 ]; then
    sketchybar --set $NAME label="$EVENT_TITLE in ${HOURS}h"
  else
    sketchybar --set $NAME label="$EVENT_TITLE in ${HOURS}h${MINS}m"
  fi
fi
