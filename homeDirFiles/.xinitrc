/usr/bin/pipewire &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
exec slstatus &
xbindkeys &
exec dwm

