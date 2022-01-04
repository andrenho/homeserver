FROM alpine
RUN apk add --no-cache dnsmasq bind-tools
VOLUME /etc/dnsmasq.d
EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "-k"]
