set -x PATH $PATH $HOME/.rbenv/bin
set -x PATH $PATH $HOME/code/flutter/bin $HOME/Android/Sdk/platform-tools

if status is-interactive
  source (rbenv init -|psub)
  source (nodenv init -|psub)
end

set -x TERMINAL termite
set -x GOPATH $HOME/code/go
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x GTK_SCALE 2

alias yao "yaourt"
alias dc "docker-compose"
alias vi "vim"
alias v "vim"
alias e "emacsclient -nc"
alias rake "bundle exec rake"
alias rspec "bundle exec rspec"
alias rails "bundle exec rails"

if reboot_check
  echo "The kernel is out of date, it's time to reboot!"
end

if not pgrep -u "$USER" ssh-agent > /dev/null
  ssh-agent -c > ~/.ssh-agent-thing
  chmod +x ~/.ssh-agent-thing
end
if [ "$SSH_AGENT_PID" = "" ]
  eval (cat ~/.ssh-agent-thing)
end

if status is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end
