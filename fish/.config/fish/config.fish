eval (dircolors -c ~/.config/dircolors)

set -x GOPATH $HOME/code/go
set -x PATH $PATH $GOPATH/bin
set -x GOPRIVATE github.com/docker

set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/.gem/ruby/2.6.0/bin
set -x PATH $PATH $HOME/.local/share/ponyup/bin
set -x PATH $PATH /var/lib/snapd/snap/bin

set -x TERMINAL termite
set -x GPG_TTY (tty)
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x ERL_AFLAGS -kernel shell_history enabled

set -g theme_display_k8s_context yes
set -g theme_date_timezone :/etc/localtime

alias dc "docker-compose"
alias vi "vim"
alias v "vim"
alias e "emacsclient -nc"
alias rake "bundle exec rake"
alias rspec "bundle exec rspec"
alias rails "bundle exec rails"
alias up "upgrade"

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
else if status is-interactive
  source /opt/asdf-vm/asdf.fish
  #taoup-fortune

  if reboot_check
    echo "The kernel is out of date, it's time to reboot!"
  end
end

