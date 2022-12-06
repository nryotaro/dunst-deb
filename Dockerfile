FROM ubuntu:22.04
WORKDIR /root
ENV version 1.9.0
RUN apt update && \
    apt install -y libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev git build-essential libnotify-bin libnotify-dev && \
    git clone https://github.com/dunst-project/dunst.git && \
    cd dunst && \
    git checkout $VERSION && \
    mkdir -p artifact/DEBIAN && \
    make PREFIX=/root/artifact SYSTEMD=1 WAYLAND=1 DATADIR=/root/artifact/usr && \
    make PREFIX=/root/artifact SYSTEMD=1 WAYLAND=1 DATADIR=/root/artifact/usr install
    # echo "Package: dunst" > artifact/DEBIAN/control && \
    # echo "Version: $VERSION" >> artifact/DEBIAN/control && \
    # echo "Maintainer: Ryotaro Nakamura" >> artifact/DEBIAN/control && \
    # echo "Architecture: any" >> artifact/DEBIAN/control
