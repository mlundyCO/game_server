#!/data/data/com.termux/files/usr/bin/bash

PORT="${1:-8000}"

HOST_IP=$(
  ifconfig 2>/dev/null |
  awk '/inet / {print $2}' |
  grep -v '^127\.' |
  grep -v '^192\.' |
  grep -v '^100\.' |
  head -n1
)
URL="http://${HOST_IP}:${PORT}/"

if [ -z "$HOST_IP" ]; then
    echo "Could not determine hotspot IP from ifconfig output."
    echo "Make sure the hotspot is turned on, then run ifconfig and inspect the hotspot-facing interface."
    exit 1
fi

echo
echo "Game server starting"
echo "Join at: $URL"
echo
qrencode -t ansiutf8 "$URL"
echo

exec python -m http.server "$PORT"
