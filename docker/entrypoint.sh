#!/bin/sh
set -e

cd /data

# Initialize panamax config if it does not exist
if [ ! -f "/data/mirror.toml" ]; then
  echo "Config file /data/mirror.toml not found. Initializing..."
  panamax init /data
  echo "Running initial sync..."
  panamax sync /data
else
  echo "Using existing config file /data/mirror.toml."
fi

echo "Starting supervisord..."
exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf