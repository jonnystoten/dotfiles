function reboot_check

  set nextline 0
  set find ""
  for i in (string split " " (file /boot/vmlinuz*))
    if [ $nextline = 1 ]
      set find $i
      break
    else
      if [ $i = "version" ]
        set nextline 1
      end
    end
  end

  if [ $find != "" ]
    set current_kernel (uname -r)
    if [ $current_kernel != $find ]
      true
    else
      false
    end
  end
end
