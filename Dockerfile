FROM alpine:latest
RUN apk update && apk add --no-cache openssh-keygen openssh curl

ENV DEVICE_HOST=
ENV DEVICE_PORT=9922
ENV DEVICE_USERNAME=prisoner
ENV DEVICE_PASSPHRASE=
ENV PRIV_KEY_FILE="/config/webos_privkey.key"
ENV SESSION_TOKEN_CACHE="/config/webos_devmode_token.txt"

COPY renew-dev-mode.sh /app/
CMD /app/renew-dev-mode.sh
