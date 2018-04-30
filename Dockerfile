FROM alpine

MAINTAINER Mattias Cibien <mattias@mattiascibien.net>

ARG GODOT_VERSION=3.0.2
ARG GODOT_VARIANT=stable

RUN apk update
    && apk add wget unzip zip \
    && wget \
"http://download.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_linux_server.64.zip" \
"http://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_export_templates.tpz" \
    && unzip Godot_v*_linux_server.64.zip \
    && mv Godot_v*_linux_server.64 /bin/godot \
    && mkdir -p ~/.local/share/godot/templates \
    && unzip Godot_v*_export_templates.tpz \
    && mv templates/ ~/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_VARIANT}/ \
    && rm -f *.zip *.tpz

RUN mkdir -p ~/.cache && mkdir -p ~/.config/godot
