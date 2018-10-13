FROM alpine

MAINTAINER IoriBranford <ioribranford@gmail.com>

ARG GODOT_VERSION=3.0.6
ARG GODOT_VARIANT=stable

# TODO find Alpine's actual PATH, install Godot in one of those places instead
ENV PATH /bin:$PATH

RUN echo "ipv6" >> /etc/modules \
    && apk update \
    && apk add wget unzip zip \
    && wget \
"http://download.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_linux_headless.64.zip" \
"http://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_export_templates.tpz" \
    && unzip Godot_v*_linux_headless.64.zip \
    && chmod +x Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_linux_headless.64 \
    && mv Godot_v*_linux_headless.64 /bin/godot \
    && mkdir -p ~/.local/share/godot/templates \
    && unzip Godot_v*_export_templates.tpz \
    && mv templates/ ~/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_VARIANT}/ \
    && rm -f *.zip *.tpz

RUN mkdir -p ~/.cache && mkdir -p ~/.config/godot
