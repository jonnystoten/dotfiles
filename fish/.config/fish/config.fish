if status is-interactive
  source (nodenv init -|psub)
end

set -x GOPATH $HOME/code/go

alias yao "yaourt"
alias dc "docker-compose"

if status is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end
