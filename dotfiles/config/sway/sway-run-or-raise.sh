#!/bin/sh

PROGRAM=$1
TITLE=$2
WIDTH=$3
HEIGHT=$4
POS=$5

# Try to find if app is running and visible in floating nodes
VISIBLE="$(swaymsg -t get_tree | jq -r ".nodes[].nodes[].floating_nodes[] | .. | select(.name? != null) | select(.name|test(\"$TITLE\")) | .visible?" | head -n 1)"

# If app is not found floating, check non floating nodes
if [[ -z "$VISIBLE" ]]; then
  VISIBLE="$(swaymsg -t get_tree | jq -r ".nodes[].nodes[].nodes[] | .. | select(.name? != null) | select(.name|test(\"$TITLE\")) | .visible?" | head -n 1)"
fi

# If app is running and visible, then hide it
if [ "$VISIBLE" = "true" ]; then
   swaymsg "[title=\"$TITLE\"]" move scratchpad
# If app is running and not visible then show it
elif [ "$VISIBLE" = "false" ]; then
   swaymsg "[title=\"$TITLE\"]" scratchpad show
   swaymsg "[title=\"$TITLE\"]" resize set $WIDTH $HEIGHT
   swaymsg "[title=\"$TITLE\"]" move position $POS
# If app is not running then start it
else
   swaymsg exec "$PROGRAM"
fi
