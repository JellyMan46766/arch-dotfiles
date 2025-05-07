#!/bin/sh

class=$(playerctl metadata -a --format '{{lc(status)}}')

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata -a --format '{{artist}} - {{title}}')
  icon=""
  if [[ ${#info} > 40 ]]; then
    info=$(echo $info | cut -c1-30)"..."
  fi
  text=$icon"  "$info
elif [[ $class == "paused" ]]; then
  info=$(playerctl metadata -a --format '{{artist}} - {{title}}')
  icon=""
  if [[ ${#info} > 40 ]]; then
    info=$(echo $info | cut -c1-30)"..."
  fi
  text=$icon"  "$info
elif [[ $class == "stopped" ]]; then
  text=""
fi

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
