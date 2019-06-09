eval (dircolors -c ~/.config/dircolors)

if status is-interactive
  source /opt/asdf-vm/asdf.fish
end

set -x PATH $PATH $HOME/.local/bin

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
alias git "hub"

if reboot_check
  echo "The kernel is out of date, it's time to reboot!"
end

if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
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
