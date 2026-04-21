#!/usr/bin/env bash

tmux list-panes -a -F '#{pane_id}	#{pane_title}	#{pane_current_command}' 2>/dev/null |
  while IFS=$'\t' read -r pane title command; do
    case "$title:$command" in
      agent-sidebar:*|*tmux-agent-status/scripts/sidebar*|*:sidebar.sh|*:sidebar-collector.sh|*:sidebar-col*)
        tmux kill-pane -t "$pane" 2>/dev/null || true
        ;;
    esac
  done
