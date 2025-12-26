#!/bin/zsh

if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo "%{F#707880}󰂲 Off"
else
  DEVICE=$(bluetoothctl info | grep "Name" | cut -d ' ' -f 2-)
  
  if [ -z "$DEVICE" ]; then
    echo "%{F#F0C674}󰂯%{F-} On"
  else
    echo "%{F#F0C674}󰂱%{F-} $DEVICE"
  fi
fi
