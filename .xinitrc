sudo mount /dev/sda3 ~/Local\ Disk\ C &
sudo mount /dev/sda5 ~/Local\ Disk\ E &
sudo mount /dev/sda4 ~/Local\ Disk\ D &
brightnessctl s 0
redshift -O 4500
redshift -O 4500
nitrogen --restore
picom --experimental-backend -b
dunst &
slstatus &

exec dwm
#sxhkd &
#exec bspwm
