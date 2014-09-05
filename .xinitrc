#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
export PATH
setxkbmap pl
#find ~/ \( ! -regex '.*/\..*' \) | sed 's/ /\\ /g' | sort -f &
/usr/bin/xscreensaver -no-splash &
exec feh --bg-scale /home/m87/img/bg.jpg &
exec compton --config /home/m87/.config/compton.cfg -b  &
exec i3
#exec cinnamon-session
