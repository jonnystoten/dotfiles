function screencast
  set tmpfile (mktemp -t screencast-XXXXXXXX).mkv
  set output $HOME/screencasts/(date +%F-%H-%M-%S)

  trap "rm -f $tmpfile" EXIT

  grab | read x y w h
  ffmpeg -f x11grab -s {$w}x{$h} -i :0.0+$x,$y $tmpfile

  ffmpeg -y -i $tmpfile -vf fps=10,palettegen /tmp/palette.png
  ffmpeg -i $tmpfile -i /tmp/palette.png -filter_complex "paletteuse" $output.gif

  mv $tmpfile $output.mkv

  mpv $output.gif
end
