FROM archlinux/base:latest

ARG RENPY_VERSION="7.3.5"
ARG RENPY_TARBALL="renpy-$RENPY_VERSION-sdk.tar.bz2"

# Install dependencies
RUN pacman -Syy && yes | pacman -S git tar unzip wget
# Set up path
RUN mkdir -p /renpy/tmp
WORKDIR /renpy/tmp
# Install Ren'Py
RUN wget "https://www.renpy.org/dl/$RENPY_VERSION/$RENPY_TARBALL" && tar -xf "$RENPY_TARBALL"
RUN mv "renpy-$RENPY_VERSION-sdk" engine && mv engine /renpy
# TODO Install Ren'Py Raspberry Pi support
# Download the itch.io butler
RUN curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default && unzip -j butler.zip
# Download ghr
RUN curl -L https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_386.tar.gz | tar -xz --strip-components 1
# Move binaries to ~/renpy
RUN mv butler /renpy && mv ghr /renpy
WORKDIR /renpy
RUN ln -s engine/renpy.sh renpy.sh
# Clean up
RUN rm -rf tmp
# Make binaries executable
RUN chmod +x butler && chmod +x ghr
# Upgrade butler
RUN ./butler upgrade && ./butler -V
RUN ls -la

ENV PATH="$PATH:/renpy"

# Run Ren'Py tests
# RUN ./renpy.sh "../ganbatte/" lint
# Build distribution files
# RUN ./renpy.sh launcher distribute "../ganbatte/"
