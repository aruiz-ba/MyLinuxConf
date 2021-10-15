#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#set english layout
setxkbmap -layout us
#map cap key
xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC

setxkbmap en &

# keyboard rate
xset r rate 180 40

# Wallpaper
nitrogen --restore & 
#wal -i ~/.Backgrounds/Pictures_Wallpapers_ultraviolet4k.jpg

# Compositor

picom -f &

#blue light filter
redshift -t 6500:3000 -l 40.416775:-3.703790 &

# Statusbar
/home/$USER/Programs/my_git/my_dwm/dwm-bar/dwm_bar.sh &

# automount external drives
udiskie &

# Execute DWM
#exec --no-startup-id dunst
exec dwm
