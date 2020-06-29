FROM ubuntu:xenial

WORKDIR /root

RUN apt-get update

# NoVNC
RUN apt-get install -y git python3 supervisor x11vnc
RUN git clone https://github.com/novnc/noVNC.git /root/noVNC
RUN git clone https://github.com/novnc/websockify /root/noVNC/utils/websockify
RUN rm -rf /root/noVNC/.git
RUN rm -rf /root/noVNC/utils/websockify/.git
RUN sed -i -- "s/ps -p/ps -o pid | grep/g" /root/noVNC/utils/launch.sh

# Godot
RUN apt-get install -y wget unzip ca-certificates x11vnc xvfb libxcursor1 libasound2 libpulse0 libfreetype6 libxinerama1 libzlcore0.13
RUN wget "http://download.tuxfamily.org/godotengine/3.2.2/Godot_v3.2.2-stable_x11.64.zip"
RUN unzip Godot_v*_x11.64.zip
RUN mv Godot_v*_x11.64 /bin/godot

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY MyProject /root/MyProject

EXPOSE 8080

# Cleanup
RUN rm -f *.zip *.tpz
RUN apt-get purge -y --auto-remove wget unzip
RUN rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
