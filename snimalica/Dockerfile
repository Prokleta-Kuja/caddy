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

COPY delete-old-recordings.sh /etc/cron.daily/
RUN chmod +x /etc/cron.daily/delete-old-recordings.sh
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
