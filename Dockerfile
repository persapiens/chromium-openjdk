FROM alpine:edge
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# install openjdk8, headless gui tools, bash, chromium
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache --update openjdk8 ttf-dejavu xvfb dbus bash chromium

# install chrome launch script modification
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN mv /usr/bin/chromium-browser /usr/bin/chromium-browser-original && \
  chmod +x /usr/bin/xvfb-chromium && \
  ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome && \
  ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

