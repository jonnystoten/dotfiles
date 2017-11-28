if status is-interactive
  source (nodenv init -|psub)
end

set -x GOPATH $HOME/code/go
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x GTK_SCALE 2

alias yao "yaourt"
alias dc "docker-compose"
alias vi "vim"
alias v "vim"
alias e "emacsclient -nc"

if reboot_check
  echo "The kernel is out of date, it's time to reboot!"
end

if status is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end