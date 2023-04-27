FROM alpine:edge

ARG AUUID="ba8a8093-effa-4441-aac7-b369a6a58847"
ARG CADDYIndexPage="https://eee-ee.koyeb.app/"
ARG ParameterSSENCYPT="chacha20-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    wget -N https://github.com/Misaka-blog/KOXray/raw/master/deploy.sh && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
