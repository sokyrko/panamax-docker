# Use an official Rust image as a base
FROM rust:1.81-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    pkg-config \
    libssl-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN git clone https://github.com/panamax-rs/panamax.git

# Build and install panamax
WORKDIR /usr/src/panamax
RUN cargo install --path . --root /usr/local

FROM debian:stable-slim

VOLUME /data
WORKDIR /data

# Install runtime dependencies (ca-certificates for HTTPS, supervisor for process management)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    libssl-dev \
    supervisor \
    cron \
    git && \
    git config --global --add safe.directory '/data' && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/panamax /usr/local/bin/panamax

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
COPY panamax-sync-cron /etc/cron.d/panamax-sync

RUN chmod +x /entrypoint.sh /etc/cron.d/panamax-sync

ENTRYPOINT ["/entrypoint.sh"]
