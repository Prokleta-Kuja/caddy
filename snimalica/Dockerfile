FROM debian:stable-slim

ENV TZ=Europe/Zagreb \
    KEEP_DAYS=3 \
    SPLIT_TIME=900 \
    INPUT_STREAM="" \
    TITLE="" \
    COMMENT=""

VOLUME [ "/data" ]

RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    ffmpeg \
  ; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
