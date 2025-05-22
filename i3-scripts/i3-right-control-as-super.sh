#!/usr/bin/env bash

# One can find the mappings greping the files in /usr/share/X11/xkb/rules/

# altwin:ctrl_rwin     Ctrl is mapped to Right Win and the usual Ctrl
# ctrl:swap_rwin_rctl  Swap Right Win with Right Ctrl
# ctrl:rctrl_ralt      Right Ctrl as Right Alt

setxkbmap -option altwin:ctrl_rwin
