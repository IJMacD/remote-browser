FROM ubuntu:22.04

COPY tigervncserver_1.13.1-1ubuntu1_arm64.deb .
RUN apt-get update && apt-get install -y \
    xkb-data \
    matchbox \
    git \
    python3 \
    python3-numpy \
    ./tigervncserver_1.13.1-1ubuntu1_arm64.deb

# Use git to get viewer
RUN git clone https://github.com/novnc/noVNC.git && git clone https://github.com/novnc/websockify.git /noVNC/utils/websockify

COPY chrome/arm64/install-chromium.sh .
RUN /install-chromium.sh

COPY chrome/launch-chrome.sh .
CMD [ "/bin/sh", "/launch-chrome.sh" ]