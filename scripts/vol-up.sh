#!/bin/bash
max=100
current=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | tr -d '%' | sort -nr | head -1)

if [ "$current" -lt "$max" ]; then
  next=$((current + 5))
  if [ "$next" -lt "$max" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
  else
    pactl set-sink-volume @DEFAULT_SINK@ 100%
  fi
fi

