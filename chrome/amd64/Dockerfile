FROM ubuntu:22.04

COPY tigervncserver_1.13.1-1ubuntu1_amd64.deb .
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    xkb-data \
    matchbox \
    git \
    python3 \
    python3-numpy \
    libnss3 \
    libgbm1 \
    libasound2 \
    ./tigervncserver_1.13.1-1ubuntu1_amd64.deb

# Use git to get viewer
RUN git clone https://github.com/novnc/noVNC.git && git clone https://github.com/novnc/websockify.git /noVNC/utils/websockify

# Run script to fetch chromium
COPY chrome/amd64/install-chrome.sh .
RUN /install-chrome.sh

COPY chome/launch-chrome.sh .
CMD [ "/bin/sh", "/launch-chrome.sh" ]