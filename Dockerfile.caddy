FROM caddy:2.5.1-builder AS builder

RUN xcaddy build \
    --with github.com/porech/caddy-maxmind-geolocation@89d86498ab7d55c9212c0c6b4d1ac9026929147b \
    --with github.com/caddy-dns/cloudflare@91cf700356a1cd0127bcc4e784dd50ed85794af5

FROM caddy:2.5.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
