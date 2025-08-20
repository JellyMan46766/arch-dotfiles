#!/bin/sh

class=$(playerctl metadata -p mpd --format '{{lc(status)}}')

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata -p mpd --format '{{artist}} - {{title}}')
  icon=""
  if [[ ${#info} > 40 ]]; then
    info=$(echo $info | cut -c 1-30)"..."
  fi
  text=$icon"  "$info
elif [[ $class == "paused" ]]; then
  info=$(playerctl metadata -p mpd --format '{{artist}} - {{title}}')
  icon=""
  if [[ ${#info} > 40 ]]; then
    info=$(echo $info | cut -c 1-30)"..."
  fi
  text=$icon"  "$info
elif [[ $class == "stopped" ]]; then
  text=""
fi

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
