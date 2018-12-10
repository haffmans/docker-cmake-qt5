FROM        ubuntu:18.04
MAINTAINER  Wouter Haffmans <wouter@simply-life.net>

RUN apt-get update \
    && apt-get install -y \
        software-properties-common \
        wget \
        curl

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        git

RUN apt-get install -y \
        cmake \
        libqt5charts5 \
        libqt5charts5-dev \
        libqt5concurrent5 \
        libqt5core5a \
        libqt5dbus5 \
        libqt5gui5 \
        libqt5location5 \
        libqt5location5-plugins \
        libqt5multimedia5 \
        libqt5multimedia5-plugins \
        libqt5network5 \
        libqt5opengl5 \
        libqt5opengl5-dev \
        libqt5qml5 \
        libqt5quick5 \
        libqt5quickcontrols2-5 \
        libqt5quickparticles5 \
        libqt5quicktemplates2-5 \
        libqt5quicktest5 \
        libqt5quickwidgets5 \
        libqt5script5 \
        libqt5scripttools5 \
        libqt5sensors5 \
        libqt5sensors5-dev \
        libqt5serialport5 \
        libqt5serialport5-dev \
        libqt5sql5 \
        libqt5sql5-odbc \
        libqt5sql5-psql \
        libqt5sql5-sqlite \
        libqt5svg5 \
        libqt5svg5-dev \
        libqt5test5 \
        libqt5webchannel5 \
        libqt5webchannel5-dev \
        libqt5webengine-data \
        libqt5webengine5 \
        libqt5webenginecore5 \
        libqt5webenginewidgets5 \
        libqt5websockets5 \
        libqt5websockets5-dev \
        libqt5widgets5 \
        libqt5xml5 \
        libqt5xmlpatterns5 \
        pyqt5-dev \
        python3-pyqt5 \
        python3-pyqt5-dbg \
        qt5-default \
        qt5-qmake \
        qt5-image-formats-plugins \
        qtdeclarative5-dev \
        qtdeclarative5-dev-tools \
        qtdeclarative5-models-plugin \
        qtdeclarative5-qtquick2-plugin \
        qtdeclarative5-window-plugin \
        qtlocation5-dev \
        qtmultimedia5-dev \
        qtquickcontrols2-5-dev \
        qtscript5-dev \
        qtwebengine5-dev \
        qtwebengine5-dev-tools \
        qttools5-dev-tools \
        qttools5-dev \
        qtxmlpatterns5-dev-tools \
        qml-module-qt-labs-calendar \
        qml-module-qt-labs-folderlistmodel \
        qml-module-qt-labs-platform \
        qml-module-qt-labs-settings \
        qml-module-qt-labs-sharedimage \
        qml-module-qt-websockets \
        qml-module-qt3d \
        qml-module-qtcharts \
        qml-module-qtgraphicaleffects \
        qml-module-qtlocation \
        qml-module-qtmultimedia \
        qml-module-qtqml-models2 \
        qml-module-qtqml-statemachine \
        qml-module-qtquick-controls \
        qml-module-qtquick-controls2 \
        qml-module-qtquick-dialogs \
        qml-module-qtquick-extras \
        qml-module-qtquick-layouts \
        qml-module-qtquick-particles2 \
        qml-module-qtquick-templates2 \
        qml-module-qtquick-virtualkeyboard \
        qml-module-qtquick-window2 \
        qml-module-qtquick2 \
        qml-module-qtsensors \
        qml-module-qttest \
        qml-module-qtwebengine \
        qml-module-qtwebsockets \
        qml-module-qtwebview

RUN apt-get install -y \
        libncurses5 \
        libncurses5-dbg \
        libncurses5-dev \
        libncursesw5 \
        libncursesw5-dbg \
        libncursesw5-dev \
        libreadline7 \
        libreadline7-dbg \
        libreadline-dev \
        libmagick++6 \
        libmagick++-dev \
        imagemagick

# Create devel user...
RUN useradd -m -d /home/devel -u 1000 -U -G users,tty -s /bin/bash devel
USER devel
ENV HOME=/home/devel
WORKDIR /home/devel

# ... but don't use it on the next image builds
ONBUILD USER root
ONBUILD WORKDIR /
