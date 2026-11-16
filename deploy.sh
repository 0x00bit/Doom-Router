#!/bin/env sh
# Usage: ./deploy.sh [ROUTER IP] [PORT]
# Copy ./www to /tmp/doom in the /tmp (RAM) of the router and runs the uhttpd.
ROUTER=${1:-192.168.1.1}
PORT=${2:-8080}
DIR="$(cd "$(dirname "$0")" && pwd)/www"

tar cf - -C "$DIR" . | ssh root@$ROUTER "
  rm -rf /tmp/doom && mkdir -p /tmp/doom && tar xf - -C /tmp/doom &&
  (pidof uhttpd >/dev/null && killall -q uhttpd 2>/dev/null; true) &&
  echo 'RAM livre:' && free | head -2 &&
  uhttpd -f -p 0.0.0.0:$PORT -h /tmp/doom >/dev/null 2>&1 &
  sleep 1; echo 'OK -> http://$ROUTER:$PORT'
"
