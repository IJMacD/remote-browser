#!/bin/sh
Xvnc -noreset -SecurityTypes none &
sleep 2
export DISPLAY=:0
matchbox-window-manager -use_titlebar no &
useradd -m user
(while true; do runuser -u user -- /latest/chrome-linux/chrome --no-sandbox; echo "'chrome' crashed with exit code $?.  Respawning.." >&2; sleep 1; done) &
openssl req -new -x509 -days 365 -nodes -out ./noVNC/utils/self.pem -keyout ./noVNC/utils/self.pem
./noVNC/utils/novnc_proxy
