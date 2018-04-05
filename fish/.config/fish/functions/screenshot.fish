function screenshot
  set tmpfile (mktemp -t screenshots-XXXXXXXX).png
  set output $HOME/screenshots/(date +%F-%H-%M-%S)

  trap "rm -f $tmpfile" EXIT

  grab | read x y w h
  ffmpeg -f x11grab -s {$w}x{$h} -i :0.0+$x,$y -vframes 1 $tmpfile

  mv $tmpfile $output.png

  feh -. $output.png
end

