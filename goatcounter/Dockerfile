FROM alpine:3.18

ARG TARGETPLATFORM
ENV GOATCOUNTER_VERSION 'v2.4.1'
ENV INITIAL_DOMAIN 'delete.me'
ENV INITIAL_EMAIL 'user@delete.me'
ENV INITIAL_PASSWORD 'P@ssw0rd!'
ENV GOATCOUNTER_DB 'sqlite+/app/db/goatcounter.sqlite3'
ENV EMAIL_FROM 'no-reply@example.com'

WORKDIR /app

RUN if [ "linux/amd64" == "${TARGETPLATFORM}" ]; then \
        wget -O- "https://github.com/arp242/goatcounter/releases/download/$GOATCOUNTER_VERSION/goatcounter-$GOATCOUNTER_VERSION-linux-amd64.gz" | \
	    gunzip >/usr/bin/goatcounter && chmod a+x /usr/bin/goatcounter; \
    elif [ "linux/arm64" == "${TARGETPLATFORM}" ]; then \
        wget -O- "https://github.com/arp242/goatcounter/releases/download/$GOATCOUNTER_VERSION/goatcounter-$GOATCOUNTER_VERSION-linux-arm64.gz" | \
	    gunzip >/usr/bin/goatcounter && chmod a+x /usr/bin/goatcounter; \
    else \
        echo "No valid filename"; \
        return 64; \
    fi;

COPY *.sh ./

VOLUME ["/app/db"]
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/app/goatcounter.sh"]