function upgrade
  sudo pacman -Syu
  aursync -u
  sudo pacman -Syu
end
