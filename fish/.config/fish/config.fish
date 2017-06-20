if status is-interactive
  source (nodenv init -|psub)
end

set -x GOPATH $HOME/code/go

alias yao "yaourt"
alias dc "docker-compose"
