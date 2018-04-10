function screensize
  xdpyinfo | grep -i dimensions: | awk '{print $2}'
end

