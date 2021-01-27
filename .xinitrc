#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#map cap key
xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC

setxkbmap en &

# keyboard rate
xset r rate 200 30

# Wallpaper

nitrogen --restore & 

# Compositor

picom -f &

# Statusbar
/home/$USER/programs/system/dwm_programs/dwm-bar/dwm_bar.sh &

# automount external drives

udiskie &

# Execute DWM
#exec --no-startup-id dunst
exec dwm
