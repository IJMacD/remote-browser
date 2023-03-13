FROM ubuntu:22.04

COPY tigervncserver_1.13.1-1ubuntu1_amd64.deb .
RUN apt-get update && apt-get install -y \
    software-properties-common \
    xkb-data \
    matchbox \
    git \
    python3 \
    python3-numpy \
    ./tigervncserver_1.13.1-1ubuntu1_amd64.deb

# Make sure we get non-snap version
RUN add-apt-repository ppa:mozillateam/ppa
COPY firefox/mozilla-firefox /etc/apt/preferences.d/
RUN apt-get install -y firefox

# Use git to get viewer
RUN git clone https://github.com/novnc/noVNC.git && git clone https://github.com/novnc/websockify.git /noVNC/utils/websockify

VOLUME [ "/certs" ]
COPY firefox/launch.sh .
CMD [ "/bin/sh", "/launch.sh" ]