#!/bin/sh

[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

session=${1:-i3}

case $session in
    i3|i3                      ) exec i3;;
    openbox-session|openbox|ob ) exec openbox-session;;
    qtile                      ) exec qtile;;
    qtile-session              ) exec qtile-session;;
    *                          ) exec $1;;
esac
