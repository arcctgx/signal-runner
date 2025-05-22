# hadolint global ignore=DL3008

FROM ubuntu:focal-20250404

RUN apt-get update \
    && apt-get --no-install-recommends -y install ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY signal/signal-desktop-keyring.gpg /usr/share/keyrings/

COPY signal/signal-xenial.list /etc/apt/sources.list.d/

RUN apt-get update \
    && apt-get --no-install-recommends -y install \
      xdg-utils \
      signal-desktop=7.48.0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -u 1000 -g 100 --shell /bin/bash --create-home --no-user-group signal

USER 1000:100

WORKDIR /home/signal/

RUN mkdir tmp

ENTRYPOINT ["/usr/bin/signal-desktop", "--no-sandbox"]
