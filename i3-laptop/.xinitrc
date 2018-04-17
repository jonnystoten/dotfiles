#!/bin/bash

# required for dunst
systemctl --user import-environment DISPLAY

exec i3
