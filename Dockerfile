FROM archlinux/base:latest

ARG RENPY_VERSION="7.3.5"

# Install dependencies
RUN pacman -Syy && yes | pacman -S coreutils grep python2 python2-pygame-sdl2 python-pip tar unzip which
# Set up path
RUN mkdir -p /renpy/tmp
WORKDIR /renpy/tmp
# Download the itch.io butler
RUN curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default && unzip -j butler.zip
# Download ghr
RUN curl -L https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_386.tar.gz | tar -xz --strip-components 1
# Move binaries to ~/renpy
RUN mv butler /renpy && mv ghr /renpy
WORKDIR /renpy
# Clean up
RUN rm -rf tmp
# Make binaries executable
RUN chmod +x butler && chmod +x ghr
# Upgrade butler
RUN ./butler upgrade && ./butler -V
# Install Ren'Py
RUN pip install renutil
RUN renutil install "$RENPY_VERSION"
RUN which grep
RUN which cut

ENV PATH="$PATH:/renpy"
