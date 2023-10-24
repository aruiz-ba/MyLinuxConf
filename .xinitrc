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
xset r rate 170 55

#if theres external screen
if [ $(xrandr -q | grep "DP2-2 connected" | wc -l) != 0 ] ; then
	xrandr --output DP2-2 --auto --above eDP1
  xrandr --output eDP1 --off
fi

if [ $(xrandr -q | grep "DP2 connected" | wc -l) != 0 ] ; then
	xrandr --output DP2 --rotate left --auto --above eDP1
  xrandr --output eDP1 --off
fi
#intern=LVDS1
#extern=VGA1

#if xrandr | grep "$extern disconnected"; then
#    xrandr --output "$extern" --off --output "$intern" --auto
#else
#    xrandr --output "$intern" --off --output "$extern" --auto
#fi


# Wallpaper
nitrogen --restore & 
#wal -i ~/.Backgrounds/Pictures_Wallpapers_ultraviolet4k.jpg

# Compositor

picom -f &

#blue light filter
redshift -t 6500:3000 -l 40.416775:-3.703790 &

# Statusbar
/usr/local/bin/dwm-bar/dwm_bar.sh &

# automount external drives
udiskie &

#setup dockd
dockd --daemon &

# Execute DWM
#exec --no-startup-id dunst
exec dwm
