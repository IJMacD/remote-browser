#!/bin/sh
Xvnc -noreset -SecurityTypes none &
sleep 2
export DISPLAY=:0
matchbox-window-manager -use_titlebar no &
useradd -m user
(while true; do runuser -u user firefox; echo "'firefox' crashed with exit code $?.  Respawning.." >&2; sleep 1; done) &

CERT_FILE=/certs/fullchain.pem
KEY_FILE=/certs/privkey.pem
if [ -f "$CERT_FILE" -a -f "$KEY_FILE" ]; then
    ./noVNC/utils/novnc_proxy --cert "$CERT_FILE" --key "$KEY_FILE"
else
    openssl req -new -x509 -days 365 -nodes -out ./noVNC/utils/self.pem -keyout ./noVNC/utils/self.pem -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"
    ./noVNC/utils/novnc_proxy
fi
