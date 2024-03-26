FROM jlesage/baseimage-gui:ubuntu-22.04-v4.5.3

ENV APP_NAME="NeySlim OpenRGB"
ENV KEEP_APP_RUNNING=1
ENV ENABLE_CJK_FONT=0
ENV LANG=en_US.UTF-8

RUN \
	APP_ICON_URL=https://user-images.githubusercontent.com/10430358/116797687-45a59900-aa9d-11eb-8a67-d7199b799693.png && \
    APP_ICON_DESC='{"masterPicture":"/opt/novnc/images/icons/master_icon.png","iconsPath":"/images/icons/","design":{"ios":{"pictureAspect":"noChange","assets":{"ios6AndPriorIcons":false,"ios7AndLaterIcons":false,"precomposedIcons":false,"declareOnlyDefaultIcon":true}},"desktopBrowser":{"design":"raw"},"windows":{"pictureAspect":"noChange","backgroundColor":"#da532c","onConflict":"override","assets":{"windows80Ie10Tile":false,"windows10Ie11EdgeTiles":{"small":false,"medium":true,"big":false,"rectangle":false}}},"androidChrome":{"pictureAspect":"noChange","themeColor":"#ffffff","manifest":{"display":"standalone","orientation":"notSet","onConflict":"override","declared":true},"assets":{"legacyIcon":false,"lowResolutionIcons":false}},"safariPinnedTab":{"pictureAspect":"silhouette","themeColor":"#5bbad5"}},"settings":{"scalingAlgorithm":"Mitchell","errorOnImageTooSmall":false,"readmeFile":false,"htmlCodeFile":false,"usePathAsIs":false},"versioning":{"paramName":"v","paramValue":"ICON_VERSION"}}' && \
	install_app_icon.sh "$APP_ICON_URL"

RUN apt-get update \
        && apt-get -y install \
        libusb-1.0-0 \
        libqt5widgets5 \
        libqt5core5a \
        libqt5gui5 \
        usbutils \
        i2c-tools \
        locales \
        libhidapi-dev \
        libmbedx509-1 \
        libmbedtls14 \
        && locale-gen en_US.UTF-8

	




COPY startapp.sh /
RUN chmod +x /startapp.sh

COPY openrgb /usr/src/
RUN chmod +x /usr/src/openrgb



COPY default.orp /config/xdg/config/OpenRGB/default.orp



