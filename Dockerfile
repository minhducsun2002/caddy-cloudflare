FROM alpine:3.22.2 as build
RUN apk add xcaddy git
RUN xcaddy build v2.10.0 --with github.com/caddy-dns/cloudflare --output /caddy

FROM caddy:2.10.0 as final
COPY --from=build /caddy /usr/bin/caddy

