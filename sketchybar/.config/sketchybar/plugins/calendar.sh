#!/usr/bin/env zsh

# Handle click - open meeting URL if present
if [ "$BUTTON" = "left" ]; then
  # Get both URL and notes fields from the next upcoming or current event
  EVENT_DATA=$(icalBuddy -npn -li 1 -ea -nc -nrd -iep url,notes -b "" eventsToday 2>/dev/null)
  
  # Search for common meeting URLs (Google Meet, Teams, Zoom, Webex)
  MEETING_URL=$(echo "$EVENT_DATA" | grep -oE 'https://meet\.google\.com/[a-zA-Z0-9_-]+' | head -1)
  
  if [ -z "$MEETING_URL" ]; then
    MEETING_URL=$(echo "$EVENT_DATA" | grep -oE 'https://teams\.microsoft\.com/[^ ]+' | head -1)
  fi
  
  if [ -z "$MEETING_URL" ]; then
    MEETING_URL=$(echo "$EVENT_DATA" | grep -oE 'https://[a-zA-Z0-9.-]*zoom\.us/[^ ]+' | head -1)
  fi
  
  if [ -z "$MEETING_URL" ]; then
    MEETING_URL=$(echo "$EVENT_DATA" | grep -oE 'https://[a-zA-Z0-9.-]*webex\.com/[^ ]+' | head -1)
  fi
  
  # Fallback to any URL if no meeting URL found
  if [ -z "$MEETING_URL" ]; then
    MEETING_URL=$(echo "$EVENT_DATA" | grep -oE 'https?://[^ ]+' | head -1)
  fi
  
  if [ -n "$MEETING_URL" ]; then
    open "$MEETING_URL"
  else
    open -a Calendar
  fi
  exit 0
fi

# Get the next upcoming or currently happening event using icalBuddy
# -npn: include events that have started but not yet ended (now playing)
NEXT_EVENT=$(icalBuddy -npn -li 1 -ea -nc -nrd -df "" -tf "%H:%M" eventsToday 2>/dev/null)

if [ -z "$NEXT_EVENT" ]; then
  sketchybar --set $NAME label="No events"
  exit 0
fi

# Extract event title and time range
# icalBuddy output format: "• Event Title (HH:MM - HH:MM)" or with time on next line
EVENT_LINE=$(echo "$NEXT_EVENT" | head -1)
EVENT_TITLE=$(echo "$EVENT_LINE" | sed 's/^• //' | sed 's/ ([0-9].*$//')

# Truncate title to 20 characters
if [ ${#EVENT_TITLE} -gt 20 ]; then
  EVENT_TITLE="${EVENT_TITLE:0:20}…"
fi

# Extract start and end times
START_TIME=$(echo "$NEXT_EVENT" | grep -oE '[0-9]{2}:[0-9]{2} - [0-9]{2}:[0-9]{2}' | head -1)
EVENT_START=$(echo "$START_TIME" | cut -d' ' -f1)
EVENT_END=$(echo "$START_TIME" | cut -d' ' -f3)

if [ -z "$EVENT_START" ]; then
  sketchybar --set $NAME label="$EVENT_TITLE"
  exit 0
fi

# Calculate times in minutes
CURRENT_MINUTES=$(($(date +%H) * 60 + $(date +%M)))

START_HOUR=$(echo "$EVENT_START" | cut -d: -f1)
START_MIN=$(echo "$EVENT_START" | cut -d: -f2)
START_MINUTES=$((10#$START_HOUR * 60 + 10#$START_MIN))

END_HOUR=$(echo "$EVENT_END" | cut -d: -f1)
END_MIN=$(echo "$EVENT_END" | cut -d: -f2)
END_MINUTES=$((10#$END_HOUR * 60 + 10#$END_MIN))

# Check if event is currently happening
if [ $CURRENT_MINUTES -ge $START_MINUTES ] && [ $CURRENT_MINUTES -lt $END_MINUTES ]; then
  sketchybar --set $NAME label="$EVENT_TITLE (now)"
  exit 0
fi

# Event is in the future
DIFF=$((START_MINUTES - CURRENT_MINUTES))

if [ $DIFF -lt 0 ]; then
  # Event already ended, shouldn't happen with -npn but fallback
  sketchybar --set $NAME label="No events"
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
