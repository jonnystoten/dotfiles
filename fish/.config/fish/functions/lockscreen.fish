function lockscreen
  set tmpfile (mktemp -t -u lock-XXX.png)
  set lockicon ~/.config/lock.png

  set scale $argv
  set down (math -s 3 "100 / $scale")%
  set up (math -s 3 "100 * $scale")%

  ffmpeg -f x11grab -s (screensize) -i :0 -vframes 1 $tmpfile
  convert $tmpfile -scale $down -scale $up $tmpfile
  convert $tmpfile $lockicon -gravity center -composite -matte $tmpfile

  playerctl pause

  # require password on next sudo
  sudo -K

  i3lock -n -u -i $tmpfile

  rm $tmpfile
end

