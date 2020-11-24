function upgrade
  if not sudo informant check
    return
  end

  sudo pacman -Syu
  aursync -u
  sudo pacman -Syu
end
