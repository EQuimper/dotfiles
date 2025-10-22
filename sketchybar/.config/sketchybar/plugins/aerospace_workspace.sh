#!/bin/bash

WORKSPACE=$(/opt/homebrew/bin/aerospace list-workspaces --focused)

if [ -z "$WORKSPACE" ]; then
  WORKSPACE="--"
fi

sketchybar --set "$NAME" label="$WORKSPACE"
