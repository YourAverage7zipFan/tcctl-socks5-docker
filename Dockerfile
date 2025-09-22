FROM python:3.12-alpine

# Install tc, shadowsocks or danted for SOCKS5
RUN apk add --no-cache iproute2 dante-server \
    && pip install tcconfig

# Copy in dante config (example below)
COPY sockd.conf /etc/

# Expose the proxy port
EXPOSE 1080

# Entrypoint starts both services
CMD ["sh", "-c", "sockd -D && tail -f /dev/null"]
