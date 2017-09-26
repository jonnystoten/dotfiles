if status is-interactive
  source (nodenv init -|psub)
end

set -x GOPATH $HOME/code/go
set -x VISUAL vim
set -x EDITOR $VISUAL

alias yao "yaourt"
alias dc "docker-compose"
alias vi "vim"
alias v "vim"
alias e "emacsclient -nc"

if status is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end
