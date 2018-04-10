function reboot_check
  set nextline 0
  set disk_kernel ""
  for i in (string split " " (file /boot/vmlinuz*))
    if [ $nextline = 1 ]
      set disk_kernel $i
      break
    else
      if [ $i = "version" ]
        set nextline 1
      end
    end
  end

  if [ $disk_kernel = "" ]
    # couldn't find the installed kernel version
    false
  else
    set current_kernel (uname -r)
    if [ $current_kernel != $disk_kernel ]
      true
    else
      false
    end
  end
end
