#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep --ns 0 -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bottom
polybar bottom &

echo "Bars launched..."
