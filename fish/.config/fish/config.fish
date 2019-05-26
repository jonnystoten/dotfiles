eval (dircolors -c ~/.config/dircolors)

if status is-interactive
  source (rbenv init -|psub)
  source ~/.asdf/asdf.fish
end

set -x PATH $PATH /home/jonny/.local/bin

set -x TERMINAL termite
set -x GPG_TTY (tty)
set -x GOPATH $HOME/code/go
set -x VISUAL vim
set -x EDITOR $VISUAL

alias dc "docker-compose"
alias vi "vim"
alias v "vim"
alias e "emacsclient -nc"
alias rake "bundle exec rake"
alias rspec "bundle exec rspec"
alias rails "bundle exec rails"
alias git=hub

if reboot_check
  echo "The kernel is out of date, it's time to reboot!"
end

if not pgrep -u "$USER" ssh-agent > /dev/null
  ssh-agent -c > ~/.ssh-agent-thing
end
if [ "$SSH_AGENT_PID" = "" ]
  eval (cat ~/.ssh-agent-thing) > /dev/null
end

if status is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end
