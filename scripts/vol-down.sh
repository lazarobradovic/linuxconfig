#!/bin/bash
min=0
current=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | tr -d '%' | sort -nr | head -1)

if [ "$current" -gt "$min" ]; then
  next=$((current - 5))
  if [ "$next" -gt "$min" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
  else
    pactl set-sink-volume @DEFAULT_SINK@ 0%
  fi
fi

