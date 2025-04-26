FROM golang:1.24.0-alpine3.21 as builder

WORKDIR /traefik-auth-cloudflare
COPY . .

RUN go build

###

FROM alpine:3.21

# Switch to non-root user
RUN adduser -D myapp
USER myapp
WORKDIR /home/myapp

COPY --from=builder --chown=myapp:myapp /traefik-auth-cloudflare/traefik-auth-cloudflare ./

ENTRYPOINT ["./traefik-auth-cloudflare"]
