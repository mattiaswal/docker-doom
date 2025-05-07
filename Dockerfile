FROM alpine:latest
RUN apk add xorg-server bash libdrm xf86-input-libinput mesa-dri-gallium mesa-egl xf86-video-modesetting mesa-utils mesa-gles
RUN apk add xinit xset xrandr xeyes
RUN apk add freedoom
RUN apk add chocolate-doom --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
COPY start.sh /
#COPY xinitrc /root/.xinitrc

COPY xorg.conf /etc/X11/xorg.conf
ENTRYPOINT ["/start.sh"]
