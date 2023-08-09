FROM        ubuntu:22.04
MAINTAINER  Wouter Haffmans <wouter@simply-life.net>

RUN apt-get update \
    && apt-get install -y \
        software-properties-common \
        wget \
        curl \
        gpg \
        build-essential \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Get latest version of CMake from Kitware - see https://apt.kitware.com/
# NB: This doesn't install the kitware-archive-keyring but only uses the latest version from the web.
#     If the keys rotate, this step must be re-executed when building an image.
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | \
        gpg --dearmor - > /usr/share/keyrings/kitware-archive-keyring.gpg && \
    . /etc/os-release && \
    echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ ${UBUNTU_CODENAME} main" > /etc/apt/sources.list.d/kitware.list

RUN    export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y \
        cmake \
        libqt53danimation5 \
        libqt53dcore5 \
        libqt53dextras5 \
        libqt53dinput5 \
        libqt53dlogic5 \
        libqt53dquick5 \
        libqt53dquickanimation5 \
        libqt53dquickextras5 \
        libqt53dquickinput5 \
        libqt53dquickrender5 \
        libqt53dquickscene2d5 \
        libqt53drender5 \
        libqt5bluetooth5 \
        libqt5bluetooth5-bin \
        libqt5charts5 \
        libqt5charts5-dev \
        libqt5concurrent5 \
        libqt5contacts5 \
        libqt5core5a \
        libqt5datavisualization5 \
        libqt5datavisualization5-dev \
        libqt5dbus5 \
        libqt5designer5 \
        libqt5designercomponents5 \
        libqt5feedback5 \
        libqt5feedback5-hfd \
        libqt5gamepad5 \
        libqt5gamepad5-dev \
        libqt5gui5 \
        libqt5help5 \
        libqt5location5 \
        libqt5location5-plugins \
        libqt5multimedia5 \
        libqt5multimedia5-plugins \
        libqt5multimediaquick5 \
        libqt5multimediawidgets5 \
        libqt5network5 \
        libqt5networkauth5 \
        libqt5networkauth5-dev \
        libqt5nfc5 \
        libqt5opengl5 \
        libqt5opengl5-dev \
        libqt5organizer5 \
        libqt5pdf5 \
        libqt5pdfwidgets5 \
        libqt5positioning5 \
        libqt5positioning5-plugins \
        libqt5positioningquick5 \
        libqt5printsupport5 \
        libqt5qml5 \
        libqt5qmlmodels5 \
        libqt5qmlworkerscript5 \
        libqt5quick5 \
        libqt5quickcontrols2-5 \
        libqt5quickparticles5 \
        libqt5quickshapes5 \
        libqt5quicktemplates2-5 \
        libqt5quicktest5 \
        libqt5quickwidgets5 \
        libqt5remoteobjects5 \
        libqt5remoteobjects5-dev \
        libqt5script5 \
        libqt5scripttools5 \
        libqt5scxml5 \
        libqt5scxml5-dev \
        libqt5sensors5 \
        libqt5sensors5-dev \
        libqt5serialbus5 \
        libqt5serialbus5-dev \
        libqt5serialbus5-plugins \
        libqt5serialport5 \
        libqt5serialport5-dev \
        libqt5sql5 \
        libqt5sql5-mysql \
        libqt5sql5-odbc \
        libqt5sql5-psql \
        libqt5sql5-sqlite \
        libqt5svg5 \
        libqt5svg5-dev \
        libqt5test5 \
        libqt5texttospeech5 \
        libqt5texttospeech5-dev \
        libqt5virtualkeyboard5 \
        libqt5virtualkeyboard5-dev \
        libqt5waylandclient5 \
        libqt5waylandclient5-dev \
        libqt5webchannel5 \
        libqt5webchannel5-dev \
        libqt5webengine-data \
        libqt5webengine5 \
        libqt5webenginecore5 \
        libqt5webenginewidgets5 \
        libqt5websockets5 \
        libqt5websockets5-dev \
        libqt5webview5 \
        libqt5webview5-dev \
        libqt5widgets5 \
        libqt5x11extras5 \
        libqt5x11extras5-dev \
        libqt5xml5 \
        libqt5xmlpatterns5 \
        libqt5xmlpatterns5-dev \
        pyqt5-dev \
        python3-pyqt5 \
        qtbase5-dev \
        qtbase5-dev-tools \
        qtchooser \
        qt5-qmake \
        qt5-image-formats-plugins \
        qtdeclarative5-dev \
        qtdeclarative5-dev-tools \
        qtlocation5-dev \
        qtmultimedia5-dev \
        qtquickcontrols2-5-dev \
        qtscript5-dev \
        qtwebengine5-dev \
        qtwebengine5-dev-tools \
        qttools5-dev-tools \
        qttools5-dev \
        qtxmlpatterns5-dev-tools \
        qml-module-qt-labs-animation \
        qml-module-qt-labs-calendar \
        qml-module-qt-labs-folderlistmodel \
        qml-module-qt-labs-location \
        qml-module-qt-labs-platform \
        qml-module-qt-labs-qmlmodels \
        qml-module-qt-labs-settings \
        qml-module-qt-labs-sharedimage \
        qml-module-qt-labs-wavefrontmesh \
        qml-module-qt-websockets \
        qml-module-qt3d \
        qml-module-qtaudioengine \
        qml-module-qtav \
        qml-module-qtbluetooth \
        qml-module-qtcharts \
        qml-module-qtcontacts \
        qml-module-qtdatavisualization \
        qml-module-qtfeedback \
        qml-module-qtgamepad \
        qml-module-qtgraphicaleffects \
        qml-module-qtlocation \
        qml-module-qtmultimedia \
        qml-module-qtnfc \
        qml-module-qtorganizer \
        qml-module-qtpositioning \
        qml-module-qtqml \
        qml-module-qtqml-models2 \
        qml-module-qtqml-statemachine \
        qml-module-qtqml-workerscript2 \
        qml-module-qtquick-controls \
        qml-module-qtquick-controls2 \
        qml-module-qtquick-dialogs \
        qml-module-qtquick-extras \
        qml-module-qtquick-layouts \
        qml-module-qtquick-localstorage \
        qml-module-qtquick-particles2 \
        qml-module-qtquick-pdf \
        qml-module-qtquick-privatewidgets \
        qml-module-qtquick-scene2d \
        qml-module-qtquick-scene3d \
        qml-module-qtquick-shapes \
        qml-module-qtquick-templates2 \
        qml-module-qtquick-virtualkeyboard \
        qml-module-qtquick-window2 \
        qml-module-qtquick-xmllistmodel \
        qml-module-qtquick2 \
        qml-module-qtsensors \
        qml-module-qttest \
        qml-module-qtwebchannel \
        qml-module-qtwebengine \
        qml-module-qtwebsockets \
        qml-module-qtwebview \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN    apt-get update \
    && apt-get install -y \
        libncurses6 \
        libncursesw6 \
        libreadline8 \
        libreadline-dev \
        libmagick++-dev \
        imagemagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create devel user...
RUN useradd -m -d /home/devel -u 1000 -U -G users,tty -s /bin/bash devel
USER devel
ENV HOME=/home/devel
WORKDIR /home/devel

# ... but don't use it on the next image builds
ONBUILD USER root
ONBUILD WORKDIR /
