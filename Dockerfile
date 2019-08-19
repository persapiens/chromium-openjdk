FROM persapiens/openjdk:8u222-alpine
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# install headless gui tools, bash, chromium
RUN apk add --no-cache --update xvfb dbus bash chromium 

# install chrome launch script modification
ADD xvfb-chromium /usr/bin/xvfb-chromium
# install xvfb-run script
ADD xvfb-run /usr/bin/xvfb-run

RUN mv /usr/bin/chromium-browser /usr/bin/chromium-browser-original && \
  chmod +x /usr/bin/xvfb-chromium && \
  ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome && \
  ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser && \
  chmod +x /usr/bin/xvfb-run
