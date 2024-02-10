FROM ubuntu:focal-20240123

RUN apt-get update \
    && apt-get --no-install-recommends -y install ca-certificates=20230311ubuntu0.20.04.1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY signal-desktop-keyring.gpg /usr/share/keyrings/

COPY signal-xenial.list /etc/apt/sources.list.d/

RUN apt-get update \
    && apt-get --no-install-recommends -y install \
      xdg-utils=1.1.3-2ubuntu1.20.04.2 \
      signal-desktop=6.47.0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -g 100 -u 1000 --shell /bin/bash --create-home --no-user-group signal

USER 1000:100

WORKDIR /home/signal/

CMD ["/usr/bin/signal-desktop", "--no-sandbox", "--use-tray-icon"]
