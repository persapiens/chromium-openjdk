FROM alpine:edge
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# install openjdk11, headless gui tools, bash, chromium, procps
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache --update openjdk11 ttf-dejavu xvfb dbus bash chromium procps

# install chrome launch script modification
ADD xvfb-chromium /usr/bin/xvfb-chromium
# install xvfb-run script
ADD xvfb-run /usr/bin/xvfb-run

RUN mv /usr/bin/chromium-browser /usr/bin/chromium-browser-original && \
  chmod +x /usr/bin/xvfb-chromium && \
  ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome && \
  ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser && \
  chmod +x /usr/bin/xvfb-run
